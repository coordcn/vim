function! s:FoldableRegion(tag, name, expr)
        let synexpr = 'syntax region ' . a:name . ' ' . a:expr
        let pfx = 'g:lua_syntax_fold_'
        if !exists('g:lua_syntax_nofold') || exists(pfx . a:tag) || exists(pfx . a:name)
                let synexpr .= ' fold'
        end
        exec synexpr
endfunction

" Strings
syntax match  luaStringSpecial contained #\\[\\abfnrtvz'"]\|\\x[[:xdigit:]]\{2}\|\\[[:digit:]]\{,3}#
call s:FoldableRegion('string', 'luaStringLong',
                        \ 'matchgroup=luaStringLongTag start="\[\z(=*\)\[" end="\]\z1\]" contains=@Spell')
syntax region luaString  start=+'+ end=+'+ skip=+\\\\\|\\'+ contains=luaStringSpecial,@Spell
syntax region luaString  start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=luaStringSpecial,@Spell

highlight luaString guifg=#00ff00

" Decimal constant
syntax match luaNumber "\<\d\+\>"
" Hex constant
syntax match luaNumber "\<0[xX][[:xdigit:].]\+\%([pP][-+]\=\d\+\)\=\>"
" Floating point constant, with dot, optional exponent
syntax match luaFloat  "\<\d\+\.\d*\%([eE][-+]\=\d\+\)\=\>"
" Floating point constant, starting with a dot, optional exponent
syntax match luaFloat  "\.\d\+\%([eE][-+]\=\d\+\)\=\>"
" Floating point constant, without dot, with exponent
syntax match luaFloat  "\<\d\+[eE][-+]\=\d\+\>"

highlight luaNumber guifg=#ff00ff
highlight luaFloat  guifg=#ff00ff

syntax match luaOperator "<"
syntax match luaOperator ">"
syntax match luaOperator "<="
syntax match luaOperator ">="
syntax match luaOperator "=="
syntax match luaOperator "\v\~\="
syntax match luaOperator "="

highlight luaOperator guifg=#ff4500

syntax keyword luaConstant self
highlight link luaConstant Constant

syntax match   luaDot    "\." contained
syntax match   luaColon  ":" contained
syntax match   luaMember "\(\.\|:\)\<\w\+" contains=luaDot,luaColon

highlight luaMember guifg=#6495ed
