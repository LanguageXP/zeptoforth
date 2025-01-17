@ Copyright (c) 2019-2021 Travis Bemann
@
@ Permission is hereby granted, free of charge, to any person obtaining a copy
@ of this software and associated documentation files (the "Software"), to deal
@ in the Software without restriction, including without limitation the rights
@ to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
@ copies of the Software, and to permit persons to whom the Software is
@ furnished to do so, subject to the following conditions:
@ 
@ The above copyright notice and this permission notice shall be included in
@ all copies or substantial portions of the Software.
@ 
@ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
@ IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
@ FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
@ AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
@ LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
@ OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
@ SOFTWARE.

	@@ Vector table in RAM
	allot vector_table, vector_table_size
	
	@@ Pointer to the current HERE location
	allot here, 4

	@@ Pointer to the current Flash HERE location
	allot flash_here, 4

	@@ Pointer to the base of HERE space
	allot dict_base, 4

	@@ Flag to determine whether compilation is going to Flash
	allot compiling_to_flash, 4

	@@ Flash buffers
	allot flash_buffers_start, flash_buffer_size * flash_buffer_count	

	@@ The current exception handler
	allot handler, 4

	@@ The word being currently compiled
	allot current_compile, 4

	@@ The current deferred literal
	allot deferred_literal, 4

	@@ Whether there is a deferred literal
	allot literal_deferred_q, 4
	
	@@ The last word compiled
	allot latest, 4

	@@ The last word compiled to RAM
	allot ram_latest, 4

	@@ The last word compiled to flash
	allot flash_latest, 4

	@@ The compilation wordlist
	allot wordlist, 4

	@@ The current <BUILDS target address
	allot build_target, 4

	@@ The stack base (highest point in memory)
	allot stack_base, 4

	@@ The return stack base (highest point in memory)
	allot rstack_base, 4

	@@ The stack end (lowest point in memory)
	allot stack_end, 4

	@@ The return stack end (lowest point in memory)
	allot rstack_end, 4

	@@ The flags for the word being currently compiled
	allot current_flags, 4

	@@ Whether a word has been called (without having been inlined)
	allot called, 4

	@@ The evaluation buffer index pointer
	allot eval_index_ptr, 4

	@@ The evaluation buffer count pointer
	allot eval_count_ptr, 4

	@@ The evaluation buffer pointer
	allot eval_ptr, 4

	@@ The current input buffer index
	allot input_buffer_index, 4

	@@ The input buffer count
	allot input_buffer_count, 4

	@@ The input buffer
	allot input_buffer, input_buffer_size

	@@ The current numeric base
	allot base, 4
	
	@@ Are we in compilation state
	allot state, 4

	@@ Is PAUSE enabled (enabled > 0)
	allot pause_enabled, 4

	@@ Is compress flash enabled
	allot compress_flash_enabled, 4
	
	@@ The prompt hook
	allot prompt_hook, 4

	@@ The number parser hook
	allot handle_number_hook, 4

	@@ The failed parse hook
	allot failed_parse_hook, 4

	@@ The emit hook
	allot emit_hook, 4

	@@ The emit? hook
	allot emit_q_hook, 4

	@@ The key hook
	allot key_hook, 4

	@@ The key? hook
	allot key_q_hook, 4

	@@ The refill hook
	allot refill_hook, 4

	@@ The pause hook
	allot pause_hook, 4

	@@ The dictionary size validation hook
	allot validate_dict_hook, 4

	@@ The wordlist count
	allot order_count, 4

	@@ The wordlist order
	allot order, 2 * max_order_size
	
