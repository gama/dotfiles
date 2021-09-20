bindkey -M viins '^[b' clear-screen
bindkey -M viins '^[y' insert-last-word
bindkey -M vicmd '^[b' clear-screen
bindkey -M vicmd 'â' clear-screen
bindkey -M viins 'â' clear-screen

# tab completion
setopt hash_list_all
# https://stackoverflow.com/a/14900496/8514646
bindkey '^i' expand-or-complete-prefix

# autocomplete fish-style autosuggestions with Alt-n
bindkey '^[n' autosuggest-accept 
