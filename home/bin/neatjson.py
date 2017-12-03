#!/usr/bin/env python

import sys
import re
import json
import inspect
import argparse
from collections import OrderedDict as odict


def neatify(obj, **opts):  # noqa
    """
    Generate the JSON string representation for an object,
    with a variety of formatting options.

    original author Gavin Kistner <!@phrogz.net>
    ported by Rei_Fan49

    obj [Object] the object to serialize
    opts [Dict] the formatting options
    opts [Integer] wrap        (80)    The maximum line width before wrapping. Use `false` to never wrap, or `true` to always wrap.
    opts [String]  indent      ("  ")  Whitespace used to indent each level when wrapping (without the :short option).
    opts [Boolean] indent_last (false) Indent the closing bracket for arrays and objects (without the :short option).
    opts [Boolean] short       (false) Keep the output 'short' when wrapping, putting opening brackets on the same line as the first value, and closing brackets on the same line as the last item.
    opts [Boolean] sort        (false) Sort the keys for objects to be in alphabetical order (`true`), or supply a lambda to determine ordering.
    opts [Boolean] aligned     (false) When wrapping objects, align the colons (only per object).
    opts [Integer] decimals     (null) Decimal precision to use for floats; omit to keep numberic values precise.
    opts [Integer] padding         (0) Number of spaces to put inside brackets/braces for both arrays and objects.
    opts [Integer] array_padding   (0) Number of spaces to put inside brackets for arrays. Overrides `:padding`.
    opts [Integer] object_padding  (0) Number of spaces to put inside braces for objects. Overrides `:padding`.
    opts [Integer] around_comma    (0) Number of spaces to put before/after commas (for both arrays and objects).
    opts [Integer] before_comma    (0) Number of spaces to put before commas (for both arrays and objects).
    opts [Integer] after_comma     (0) Number of spaces to put after commas (for both arrays and objects).
    opts [Integer] around_colon    (0) Number of spaces to put before/after colons (for objects).
    opts [Integer] before_colon    (0) Number of spaces to put before colons (for objects).
    opts [Integer] after_colon     (0) Number of spaces to put after colons (for objects).
    opts [Integer] around_colon_1  (0) Number of spaces to put before/after colons for single-line objects.
    opts [Integer] before_colon_1  (0) Number of spaces to put before colons for single-line objects.
    opts [Integer] after_colon_1   (0) Number of spaces to put after colons for single-line objects.
    opts [Integer] around_colon_n  (0) Number of spaces to put before/after colons for multi-line objects.
    opts [Integer] before_colon_n  (0) Number of spaces to put before colons for multi-line objects.
    opts [Integer] after_colon_n   (0) Number of spaces to put after colons for multi-line objects.
    opts [String] the JSON representation of the object.

    The lambda for the `sort` option will be passed the string name of the key, the value, and the hash for the object being sorted.
    The values returned for all keys must be all comparable, or an error will occur.
    """
    def rb(val):
        return not((val is None) or (val is False))

    def chain(*c):
        if not c:
            raise Exception('Empty chain')
        r = None
        for t in c:
            z = None
            if isinstance(t, tuple):
                o, k = t
                if k in o:
                    z = o[k]
                else:
                    continue
            else:
                z = t
            if rb(z):
                r = z
                break
        return r

    def setchain(o, k, *c):
        o[k] = chain((o, k), *c)
        return o[k]

    if 'wrap' not in opts:
        opts['wrap'] = 80
    elif opts['wrap'] is True:
        opts['wrap'] = -1
    setchain(opts, 'indent', '  ')
    setchain(opts, 'array_padding', (opts, 'padding'), 0)
    setchain(opts, 'object_padding', (opts, 'padding'), 0)
    setchain(opts, 'after_comma', (opts, 'around_comma'), 0)
    setchain(opts, 'before_comma', (opts, 'around_comma'), 0)
    setchain(opts, 'before_colon', (opts, 'around_colon'), 0)
    setchain(opts, 'after_colon', (opts, 'around_colon'), 0)
    setchain(opts, 'before_colon_1', (opts, 'around_colon_1'), (opts, 'before_colon'), 0)
    setchain(opts, 'after_colon_1', (opts, 'around_colon_1'), (opts, 'after_colon'), 0)
    setchain(opts, 'before_colon_n', (opts, 'around_colon_n'), (opts, 'before_colon'), 0)
    setchain(opts, 'after_colon_n', (opts, 'around_colon_n'), (opts, 'after_colon'), 0)

    if re.match(r"\S", opts['indent']):
        raise Exception("indent option must only whitespace")

    apad   = " " * opts['array_padding']
    opad   = " " * opts['object_padding']
    comma  = "{},{}".format(' ' * opts['before_comma'], ' ' * opts['after_comma'])
    colon1 = "{}:{}".format(' ' * opts['before_colon_1'], ' ' * opts['after_colon_1'])
    colonn = "{}:{}".format(' ' * opts['before_colon_n'], ' ' * opts['after_colon_n'])

    objid  = {}
    memo   = {}

    def memoize(o):
        try:
            i = next(idx for idx, value in enumerate(objid.values()) if value[0] is o[0] and value[1] is o[1])
        except StopIteration:
            i = len(objid.items())
            objid[i] = o
        return i

    def build(o, indent):
        mi = memoize((o, indent))
        if mi not in memo:
            if isinstance(o, basestring) or isinstance(o, int):
                memo[mi] = "{}{}".format(indent, json.dumps(o))
            elif isinstance(o, bool):
                memo[mi] = "{}{}".format(indent, repr(o).lower())
            elif o is None:
                memo[mi] = "{}{}".format(indent, 'null')
            elif isinstance(o, float):
                if False and o.is_integer() and "e" not in str(o):
                    memo[mi] = build(int(o), indent)
                elif 'decimals' in opts and isinstance(opts['decimals'], int):
                    memo[mi] = "{}{:.{}f}".format(indent, opts['decimals'], o)
                else:
                    memo[mi] = "{}{}".format(indent, repr(o))
            elif isinstance(o, list):
                if not o:
                    memo[mi] = "{}{}".format(indent, '[]')
                else:
                    pieces = [build(v, '') for v in o]
                    ol = "{}[{}{}{}]".format(indent, apad, comma.join(pieces), apad)
                    if not opts['wrap'] or len(ol) <= opts['wrap']:
                        memo[mi] = ol
                    elif opts.get('short'):
                        indent2 = "{} {}".format(indent, apad)
                        pieces = [build(v, indent2) for v in o]
                        pieces[0] = pieces[0].replace(indent2, "{}[{}".format(indent, apad), 1)
                        pieces[-1] = "{}{}]".format(indent, apad)
                        memo[mi] = ",\n".join(pieces)
                    else:
                        indent2 = "{}{}".format(indent, opts['indent'])
                        memo[mi] = "{}[\n{}\n{}]".format(
                            indent,
                            ",\n".join(build(v, indent2) for v in o),
                            indent2 if rb(opts.get('indent_last')) else indent
                        )
                    pass
            elif isinstance(o, dict):
                if not o:
                    memo[mi] = "{}{}".format(indent, o)
                else:
                    sort = chain((opts, 'sorted'), (opts, 'sort'))
                    if sort is True:
                        # key sort
                        s = sorted(o.items())
                    elif callable(sort):
                        arity = len(inspect.getargsspec(sort).args)
                        if arity > 1:
                            s = sorted(o.items(), key=lambda v: sort(*v))
                        elif arity == 1:
                            s = sorted(o.items(), key=lambda k: sort(*k))
                        pass
                    else:
                        s = list(o.items())

                    kv = [(build(str(k), ''), build(v, '')) for k, v in s]
                    ol  = "%s{%s%s%s}" % (indent, opad, comma.join(colon1.join(kvp) for kvp in kv), opad)
                    #
                    idp = ['']

                    def sconv(k, v):
                        ol  = "{}{}{}".format(k, colonn, build(v, ''))
                        if opts.get('wrap') and (len(ol) > opts.get('wrap')) and (isinstance(v, list) or isinstance(v, dict)):
                            return "{}{}{}".format(k, colonn, build(v, idp[0]).lstrip())
                        else:
                            return ol

                    def aconv(kvp):
                        longest = max(len(k) for k, v in kvp)
                        formatk = "%%-%ds" % longest

                        del kv[:]
                        kv.extend((formatk % k, v) for k, v in kvp)
                        return kv
                    #
                    if not opts['wrap'] or len(ol) <= opts['wrap']:
                        memo[mi] = ol
                    elif opts.get('short'):
                        del kv[:]
                        kv.extend(("{} {}{}".format(indent, opad, build(str(k), '')), v) for k, v in s)
                        kv[0][0] = kv[0][0].replace("{}{}".format(indent, ' '), "{}{}".format(indent, '{'), 1)
                        if opts.get('aligned'):
                            aconv(kv[:])

                        def iconv(k, v):
                            idp[0] = " " * len("{}{}".format(k, colonn))
                            return sconv(k, v)
                        skv = [iconv(k, v) for k, v in kv]
                        memo[mi] = "{}{}{}".format(indent, ",\n".join(skv), '}')
                    else:
                        del kv[:]
                        kv.extend(("{}{}{}".format(indent, opts['indent'], build(str(k), '')), v) for k, v in s)
                        if opts.get('aligned'):
                            aconv(kv[:])
                        idp[0] = '{}{}'.format(indent, opts['indent'])
                        skv = [sconv(k, v) for k, v in kv]
                        memo[mi] = "{}{}\n{}\n{}{}".format(
                            indent, '{',
                            ",\n".join(skv),
                            idp[0] if opts.get('indent_last') else indent,
                            '}'
                        )
                    pass
                pass
            else:
                memo[mi] = build(o.__dict__, indent)
        return memo[mi]
    return build(obj, '')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Neat JSON formatter', formatter_class=lambda prog: argparse.HelpFormatter(prog, max_help_position=27))
    parser.add_argument('-w', '--width',       type=int,             default=160,  help='wrap lines at WIDTH chars')
    parser.add_argument('-a', '--not-aligned', action='store_false', default=True, help='do NOT align colons')
    parser.add_argument('file', nargs='?',                           default=None, help='JSON file name')
    args = parser.parse_args()

    with open(args.file, 'r') if args.file else sys.stdin as file:
        content = json.load(file, object_pairs_hook=odict)
        print neatify(content, wrap=args.width, aligned=args.not_aligned, after_comma=True, after_colon=1)
