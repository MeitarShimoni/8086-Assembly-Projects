# Intel 8086 Assembly Language Projects

This repository contains a collection of assembly language programs written for the Intel 8086 microprocessor. These projects were developed as part of my Microcontroller course during my Electrical and Electronics Engineering studies at Ariel University.

The purpose of this collection is to demonstrate a foundational understanding of low-level programming, CPU architecture, memory management, and direct hardware interaction through the x86 instruction set.

**Technologies & Tools:**
* **Language:** Intel 8086 Assembly
* **Assembler/Emulator:** EMU8086 (or MASM/TASM)
* **Operating System:** DOS (via INT 21h interrupts)

---

## Projects

Here is a summary of the programs included in this repository.

### 1. `sum_even_in_array.asm`
* **Description:** This program prompts the user to enter 10 single-digit numbers (0-9). It validates each input to ensure it is a valid digit. The numbers are stored in an array, and the program then calculates and displays the sum of only the even numbers.
* **Key Concepts Demonstrated:**
    * User input and output (`INT 21h`).
    * Looping and counters (`LOOP` instruction).
    * Array data structures and indexed memory access.
    * Input validation and conditional branching (`CMP`, `JB`, `JA`).
    * Bitwise logic (`AND` masking) to efficiently check for even/odd numbers.

### 2. `string_char_processor.asm`
* **Description:** This program accepts a string from the user and processes it character by character. It calculates the sum of all numeric digits, swaps the case of all alphabetic characters (uppercase to lowercase and vice-versa), and counts any other non-alphanumeric characters. The results (the transformed string, the sum of digits, and the count of other characters) are then displayed.
* **Key Concepts Demonstrated:**
    * String input using buffered functions (`INT 21h`, function `0Ah`).
    * String traversal using segment registers (`LODSB`).
    * ASCII character manipulation and arithmetic.
    * Complex conditional logic for character classification.
    * Using procedures (`PROC`) for modular code, such as the number printing routine.

---

### From Software to Hardware Design

These projects represent my hands-on experience with the Instruction Set Architecture (ISA) that a CPU executes. This low-level software perspective is invaluable for my current studies in **Chip Design and Verification**, where I am learning to design the actual hardware (in Verilog and SystemVerilog) that brings these instructions to life.
