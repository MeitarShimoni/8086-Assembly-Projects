
.MODEL small
.STACK 100h

array_size EQU 10

.DATA
msg1      DB 'Enter a number (0-9) and press Enter: $'
msg2      DB 'The sum of the even numbers is: $'
msg3      DB 'Invalid input! Please enter only a single digit (0-9).$'
newline   DB 10, 13, '$'

array     DB array_size DUP(?)
sum       DW 0

; buffered input: 
; [0] max chars, [1] actual length, [2..] input
input_buffer DB 10, ?, 10 DUP('$')

.CODE

main PROC
    ; init DS
    MOV AX, @DATA
    MOV DS, AX

    ; we need 10 numbers
    MOV CX, array_size
    LEA SI, array

GET_INPUT_LOOP:
    CMP CX, 0
    JE AFTER_INPUT_LOOP   ; done when CX=0

    ; ask user for a digit
    MOV DX, OFFSET msg1
    MOV AH, 09h
    INT 21h

    ; read a line (ends on Enter)
    MOV DX, OFFSET input_buffer
    MOV AH, 0Ah
    INT 21h

    ; newline for clarity
    MOV DX, OFFSET newline
    MOV AH, 09h
    INT 21h

    ; validate input: must be 1 char
    LEA BX, input_buffer
    MOV DL, [BX+1]        ; length typed
    CMP DL, 1
    JNE INVALID_INPUT

    ; check it’s between '0' and '9'
    MOV AL, [BX+2]
    CMP AL, '0'
    JB INVALID_INPUT
    CMP AL, '9'
    JA INVALID_INPUT

    ; valid ? save in array
    SUB AL, '0'           ; ASCII ? number
    MOV [SI], AL
    INC SI
    DEC CX
    JMP GET_INPUT_LOOP

INVALID_INPUT:
    ; show error and retry
    MOV DX, OFFSET msg3
    MOV AH, 09h
    INT 21h
    MOV DX, OFFSET newline
    MOV AH, 09h
    INT 21h
    JMP GET_INPUT_LOOP

AFTER_INPUT_LOOP:
    ; done reading ? sum only evens
    CALL SUM_EVEN_ONLY

    ; print message
    MOV DX, OFFSET msg2
    MOV AH, 09h
    INT 21h

    ; print the sum
    MOV AX, sum
    CALL PRINT_NUMBER

    ; exit
    MOV AH, 4Ch
    INT 21h
main ENDP


;--------------------------------------------------
; SUM_EVEN_ONLY: sum only even numbers in array
;--------------------------------------------------
SUM_EVEN_ONLY PROC
    LEA SI, array
    MOV CX, array_size
    XOR BX, BX      ; sum accumulator

SUM_LOOP:
    MOV AL, [SI]
    TEST AL, 1      ; odd if LSB=1
    JNZ SKIP_ADD
    ADD BL, AL      ; add even

SKIP_ADD:
    INC SI
    LOOP SUM_LOOP

    MOV AX, BX
    MOV sum, AX
    RET
SUM_EVEN_ONLY ENDP


;--------------------------------------------------
; PRINT_NUMBER: prints AX as decimal
;--------------------------------------------------
PRINT_NUMBER PROC
    CMP AX, 0
    JNE CONVERT_LOOP
    MOV DL, '0'
    MOV AH, 02h
    INT 21h
    RET

CONVERT_LOOP:
    XOR CX, CX
    MOV BX, 10

DIVIDE_LOOP:
    XOR DX, DX
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    JNE DIVIDE_LOOP

PRINT_LOOP:
    POP DX
    ADD DL, '0'
    MOV AH, 02h
    INT 21h
    LOOP PRINT_LOOP
    RET
PRINT_NUMBER ENDP

END main

