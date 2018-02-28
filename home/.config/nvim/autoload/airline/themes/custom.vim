scriptencoding utf-8
let g:airline#themes#custom#palette = {}

let s:airline_a_normal   = [ '#00005f' , '#dfff00' ,  17 , 190 ]
let s:airline_b_normal   = [ '#ffffff' , '#444444' , 250 , 238 ]
let s:airline_c_normal   = [ '#9cffd3' , '#202020' , 250 , 234 ]
let g:airline#themes#custom#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)
let g:airline#themes#custom#palette.normal_modified = {
      \ 'airline_c': [ '#ffffff' , '#5f005f' , 250 , 53 , '' ] ,
      \ }

let s:airline_a_insert = [ '#00005f' , '#00dfff' ,  17 , 45  ]
let s:airline_b_insert = [ '#ffffff' , '#005fff' , 255 , 27  ]
let s:airline_c_insert = [ '#ffffff' , '#000080' ,  15 , 17  ]
let g:airline#themes#custom#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)
let g:airline#themes#custom#palette.insert_modified = {
      \ 'airline_c': [ '#ffffff' , '#5f005f' , 250 , 53 , '' ] ,
      \ }
let g:airline#themes#custom#palette.insert_paste = {
      \ 'airline_a': [ s:airline_a_insert[0]   , '#d78700' , s:airline_a_insert[2] , 172 , '' ] ,
      \ }

let g:airline#themes#custom#palette.replace = copy(g:airline#themes#custom#palette.insert)
let g:airline#themes#custom#palette.replace.airline_a = [ s:airline_b_insert[0] , '#af0000' , s:airline_b_insert[2] , 124 , '' ]
let g:airline#themes#custom#palette.replace_modified = g:airline#themes#custom#palette.insert_modified

let s:airline_a_visual = [ '#000000' , '#ffaf00' , 232 , 214 ]
let s:airline_b_visual = [ '#000000' , '#ff5f00' , 232 , 202 ]
let s:airline_c_visual = [ '#ffffff' , '#5f0000' ,  15 ,  52 ]
let g:airline#themes#custom#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)
let g:airline#themes#custom#palette.visual_modified = {
      \ 'airline_c': [ '#ffffff' , '#5f005f' , 250 , 53 , '' ] ,
      \ }

let s:airline_a_inactive = [ '#4e4e4e' , '#1c1c1c' , 246 , 234 , '' ]
let s:airline_b_inactive = [ '#4e4e4e' , '#262626' , 246 , 235 , '' ]
let s:airline_c_inactive = [ '#4e4e4e' , '#303030' , 246 , 236 , '' ]
let g:airline#themes#custom#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive)
let g:airline#themes#custom#palette.inactive_modified = {
      \ 'airline_c': [ '#875faf' , '' , 97 , '' , '' ] ,
      \ }

let g:airline#themes#custom#palette.accents = {
      \ 'red':   [ '#ff0000' , '' ,   160  , ''  ] ,
      \ 'blue':  [ '#0000ff' , '' ,    45  , ''  ] ,
      \ 'white': [ '#ffffff' , '' ,   231  , ''  ] ,
      \ 'blank': [ ''        , '' , 'None' , ''  ]
      \ }

if get(g:, 'loaded_ctrlp', 0)
  let g:airline#themes#custom#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
        \ [ '#d7d7ff' , '#5f00af' , 189 ,  55 , ''     ],
        \ [ '#ffffff' , '#875fd7' , 231 ,  98 , ''     ],
        \ [ '#5f00af' , '#ffffff' ,  55 , 231 , 'bold' ])
endif
