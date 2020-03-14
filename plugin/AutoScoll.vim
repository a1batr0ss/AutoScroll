function! MyAutoScroll()
	let s:maintain_lines=winheight(winnr()) * g:cursor_lines

	if winheight(winnr())-winline()>=s:maintain_lines
		return
	else
		let cur_line=winline()
		let distance = winheight(winnr())-cur_line

		while distance <= s:maintain_lines
			exec "normal! \<c-e>"
			let distance = distance+1
		endwhile
	endif
endfunction

autocmd! CursorMoved,CursorMovedI * call MyAutoScroll()

set virtualedit=onemore

