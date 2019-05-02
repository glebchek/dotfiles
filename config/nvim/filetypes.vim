function! DetectDash()
   let line = getline(1)
   if line =~ '^\/\/\ *@flow\ *$' || line =~ '^\/\*\ *@flow\ *\*\/$'
     if 
     	set filetype=flow
     endif
   endif
endfunction

augroup filetypedetect
  au BufRead,BufNewFile *.js call DetectFlow()
  au BufRead,BufNewFile *.jsx call DetectFlow()
  au BufRead,BufNewFile *.ts set filetype=typescript
  au BufRead,BufNewFile *.tsx set filetype=typescript.tsx
augroup END
