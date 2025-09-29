# Intel 8086 Assembly Language Projects

This repository contains a collection of assembly language programs written for the Intel 8086 microprocessor. These projects were developed as part of my Microcontroller coursework during my Electrical and Electronics Engineering studies at Ariel University.

The purpose of this collection is to demonstrate a foundational understanding of low-level programming, CPU architecture, memory management, and system-level features like interrupt handling.

**Technologies & Tools:**
* **Language:** Intel 8086 Assembly
* **Assembler/Emulator:** EMU8086 (or MASM/TASM)
* **Operating System:** DOS (via `INT 21h` interrupts)

---

## Projects

Here is a summary of the programs included in this repository.

### 1. `sum_validated_even_inputs.asm`
* **Description:** This program securely collects 10 single-digit numbers from the user. [cite_start]It performs robust input validation to ensure that each entry is exactly one character long and is a digit between '0' and '9'[cite: 55, 57]. Valid numbers are stored in an array. [cite_start]Finally, it calculates and displays the sum of only the even numbers in the array[cite: 65].
* **Key Concepts Demonstrated:**
    * [cite_start]Buffered user input (`INT 21h`, function `0Ah`)[cite: 49, 53].
    * [cite_start]Robust input validation and error handling[cite: 55, 57, 60].
    * Array data structures and memory access.
    * [cite_start]Bitwise logic (`TEST` instruction) to efficiently check for parity[cite: 67].
    * [cite_start]Modular code using procedures for summing and printing[cite: 65, 69].

### 2. `string_char_analyzer.asm`
* **Description:** This program prompts the user for a string and processes it character by character. [cite_start]It analyzes each character to classify it: digits are converted from ASCII to numeric values and added to a running total [cite: 22, 23][cite_start]; uppercase letters are converted to lowercase [cite: 24][cite_start]; lowercase letters are converted to uppercase [cite: 25][cite_start]; and all other symbols are counted. [cite_start]The program outputs the modified string, the total sum of the digits, and the count of other characters[cite: 29, 30].
* **Key Concepts Demonstrated:**
    * [cite_start]String traversal using `LODSB`[cite: 21].
    * ASCII character classification and manipulation.
    * Conditional logic for multi-way branching.
    * Using `DW` (Define Word) to store sums larger than 255.

### 3. `custom_interrupt_handler.asm`
* **Description:** This advanced program demonstrates exception handling by creating a custom interrupt service routine (ISR) for Interrupt 0 (Divide by Zero). [cite_start]It saves the original interrupt vector [cite: 36][cite_start], installs its own handler [cite: 37][cite_start], and then deliberately triggers the exception by dividing by zero[cite: 41]. [cite_start]The custom handler prints a user-friendly error message instead of crashing the program and gracefully skips the faulting instruction[cite: 45, 46]. [cite_start]Before exiting, it restores the original interrupt vector to ensure system stability[cite: 43].
* **Key Concepts Demonstrated:**
    * [cite_start]**Interrupt Vector Table manipulation (`INT 21h`, functions `25h` and `35h`)[cite: 36, 37].**
    * [cite_start]**Writing a custom Interrupt Service Routine (ISR) with `IRET`[cite: 45].**
    * Exception handling and program flow control.
    * [cite_start]Safely modifying the instruction pointer on the stack to recover from an error[cite: 46].

### 4. `string_reversal_pointers.asm`
* **Description:** A classic algorithm implementation. [cite_start]This program accepts a string from the user and reverses it in-place using a two-pointer technique[cite: 1]. [cite_start]One pointer (`SI`) starts at the beginning of the string, and the other (`DI`) starts at the end[cite: 9]. The program swaps the characters at these pointers and moves them towards the center until the entire string is reversed.
* **Key Concepts Demonstrated:**
    * The two-pointer algorithm for in-place reversal.
    * Direct memory manipulation using `SI` (Source Index) and `DI` (Destination Index) registers.
    * [cite_start]Calculating loop iterations for efficiency (only looping `n/2` times)[cite: 10].
    * Register-based swapping of values.

---

### From Software to Hardware Design

These projects represent my hands-on experience with the Instruction Set Architecture (ISA) that a CPU executes. This low-level software perspective, especially understanding system interrupts, is invaluable for my current studies in **Chip Design and Verification**, where I am learning to design the actual hardware (in Verilog and SystemVerilog) that brings these instructions and system behaviors to life.
