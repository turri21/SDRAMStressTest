	//registers used:
		//r1: yes
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_main
_main:
	stdec	r6

						//overrides.c, line 17
						//call
						//pcreltotemp
	.lipcrel	_PS2Init
	add	r7
						// Flow control - popping 0 + 0 bytes

						//overrides.c, line 19
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_menuindex
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//overrides.c, line 20
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_menupage
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// allocreg r1

						//overrides.c, line 22
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 22
						//call
						//pcreltotemp
	.lipcrel	_buildmenu
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//overrides.c, line 24
						//call
						//pcreltotemp
	.lipcrel	_EnableInterrupts
	add	r7
						// Flow control - popping 0 + 0 bytes
l6: # 
						// allocreg r1

						//overrides.c, line 28
						//call
						//pcreltotemp
	.lipcrel	_Menu_Run
	add	r7
						// Flow control - popping 0 + 0 bytes

						//overrides.c, line 26
						//pcreltotemp
	.lipcrel	l6
	add	r7
						// freereg r1
	ldinc	r6
	mr	r7

