---
layout: post
title: Useful Vim Commands
date: 2024-01-04
---

## Cursor Movement

| Command               	| Purpose                                                                                  	|
|-----------------------	|------------------------------------------------------------------------------------------	|
| `gk`                  	| Move cursor up by one line in multi-line text                                            	|
| `gj`                  	| Move cursor down by one line in multi-line text                                          	|
| `H`                   	| Jump to the line at the top of the screen                                                	|
| `M`                   	| Jump to the line at the middle of the screen                                             	|
| `L`                   	| Jump to the line at the bottom of the screen                                             	|
| `w`                   	| Jump forward to the start of the next word (punctuation counts as a separate word)       	|
| `b`                   	| Jump backward to the start of the previous word (punctuation counts as a separate word)  	|
| `e`                   	| Jump forward to the end of the current word (punctuation counts as a separate word)      	|
| `W`                   	| Jump forward to the start of the next word (punctuation counts as part of the word)      	|
| `B`                   	| Jump backward to the start of the previous word (punctuation counts as part of the word) 	|
| `E`                   	| Jump forward to the end of the current word (punctuation counts as part of the word)     	|
| `0`                   	| Jump to the beginning of the line                                                        	|
| `-`                   	| Jump to the beginning of the above line                                                  	|
| `$`                   	| Jump to the end of the line                                                              	|
| `^`                   	| Jump to the first non-whitespace character on the line                                   	|
| `%`                   	| Jump to the matching bracket `()`, `{}` or `[]`                                          	|
| `gg` or `:0`          	| Jump to the top of the file                                                              	|
| `G` or `:$`           	| Jump to the bottom of the file                                                           	|
| `ngg` or `nG` or `:n` 	| Jump to line `n`                                                                         	|
| `fc`                  	| Jump to the next occurrence of character `c`                                             	|
| `Fc`                  	| Jump to the previous occurrence of character `c`                                         	|
| `;`                   	| Repeat previous `f` or `F` movement                                                      	|
| `,`                   	| Repeat previous `f` or `F` movement, backwards                                           	|
| `}`                   	| Jump to the next paragraph or function/block                                             	|
| `{`                   	| Jump to the previous paragraph or function/block                                         	|
| `zz`                  	| Shift screen such that the current line is in the center                                 	|
| `zt`                  	| Shift screen such that the current line is at the top                                    	|
| `zb`                  	| Shift screen such that the current line is at the bottom                                 	|
| CTRL + Y              	| Shift screen up by one line (without moving cursor)                                      	|
| CTRL + E              	| Shift screen down by one line (without moving cursor)                                    	|

## Editing

| Command               	| Purpose                                                                                  	|
|-----------------------	|------------------------------------------------------------------------------------------	|
| `r`               	    | Replace the current character                                                            	|
| `R`               	    | Replace until ESC is pressed                                                             	|
| `J`               	    | Join the below line with the current line and add a space in between                     	|
| `gJ`              	    | Join the below line with the current line without a space in between                     	|
| `cc` or `S`       	    | Replace entire line                                                                      	|
| `c$` or `C`       	    | Replace from current position to the end of the line                                     	|
| `ciw`             	    | Replace current word                                                                     	|
| `cw`              	    | Replace from current position to the end of the current word                             	|
| `diw`             	    | Delete current word                                                                      	|
| `d$` or `D`       	    | Delete from current position to the end of the line                                      	|
| `dw`              	    | Delete from current position to the end of the current word                              	|
| `dd`              	    | Delete entire line                                                                       	|
| `ndd` or `dnd`    	    | Delete `n` lines including the current line                                              	|
| `dtc`             	    | Delete from current position till the first occurrence of character `c`                  	|
| `dnG`             	    | Delete all lines between the current line and line `n`, inclusive                        	|
| `dG`              	    | Delete the current line and all lines below it                                           	|
| `>>`              	    | Indent line                                                                              	|
| `n>>` or `>n>`    	    | Indent `n` lines including the current line                                              	|
| `>nG`             	    | Indent all lines between the current line and line `n`, inclusive                        	|
| `>%`              	    | Indent block (from matching brackets `()`, `{}` or `[]`)                                 	|
| `>G`              	    | Indent the current line and all lines below it                                           	|
| `<<`              	    | De-indent line                                                                           	|
| `n<<` or `<n<`    	    | De-indent `n` lines including the current line                                           	|
| `<nG`             	    | De-indent all lines between the current line and line `n`, inclusive                     	|
| `<%`              	    | De-indent block (from matching brackets `()`, `{}` or `[]`)                              	|
| `<G`              	    | De-indent the current line and all lines below it                                        	|
| `gg=G`            	    | Retab file                                                                               	|
| `u`               	    | Undo                                                                                     	|
| CTRL + R          	    | Redo                                                                                     	|
| `.`               	    | Repeat previous command                                                                  	|
| `:.,ns/foo/bar/g` 	    | Change each "foo" to "bar" in all lines between the current line and line `n`, inclusive 	|
| `:%s/^/foo/`      	    | Insert "foo" to the beginning of every line                                              	|
| `x`               	    | Delete character                                                                         	|
| `ZZ`              	    | Save and exit                                                                            	|

## Yank (Copy) and Paste

| Command               	| Purpose                                                                                  	|
|-----------------------	|------------------------------------------------------------------------------------------	|
| `yiw`          	        | Yank current word                                                     	                |
| `y$` or `Y`    	        | Yank from current position to the end of the line                     	                |
| `yw`           	        | Yank from current position to the end of the current word             	                |
| `yy`           	        | Yank entire line                                                      	                |
| `nyy` or `yny` 	        | Yank `n` lines including the current line                             	                |
| `ytc`          	        | Yank from current position till the first occurrence of character `c` 	                |
| `ynG`          	        | Yank all lines between the current line and line `n`, inclusive       	                |
| `yG`           	        | Yank the current line and all lines below it                                              |
| `p`            	        | Paste after the cursor                                                	                |
| `P`            	        | Paste before the cursor                                               	                |
| `]p`           	        | Paste and match indentation to that of the current line               	                |

## Macros

| Command 	| Purpose              	|
|---------	|----------------------	|
| `qa`    	| Record macro `a`     	|
| `q`     	| Stop recording macro 	|
| `@a`    	| Run macro `a`        	|
| `@@`    	| Rerun last run macro 	|


## Insert Mode

| Command  	| Purpose                                                   	|
|----------	|-----------------------------------------------------------	|
| `i`      	| Insert before the cursor                                  	|
| `I`      	| Insert at the beginning of the line                       	|
| `a`      	| Append after the cursor                                   	|
| `A`      	| Append at the end of the line                             	|
| `o`      	| Open a new line below the current line                    	|
| `O`      	| Open a new line above the current line                    	|
| CTRL + H 	| Delete the character before the cursor (in insert mode)   	|
| CTRL + W 	| Delete the current word up to the cursor (in insert mode) 	|
| CTRL + J 	| Add a line break at the cursor position (in insert mode)  	|
| CTRL + T 	| Indent the current line (in insert mode)                  	|
| CTRL + D 	| De-indent the current line (in insert mode)               	|

