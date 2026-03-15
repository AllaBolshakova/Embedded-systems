.global _start

.text
_start:
    mov r0, #1
    mov r1, #4
    mov r2, #5
    bl func1
    mov r7, #1
    svc #0


func1:
    push {r4, r5, r6, r7, r8, lr}
    mov r4, #10 @max
    mov r5, #0 @res
    mov r6, #0 @i
    mov r7, r0 @repeat

.loop:
    cmp r6, r7
    bge .end

    add r8, r1, r2
    mul r3, r1, r2

    add r0, r8, r3    
    add r5, r5, r0    

    cmp r8, r4
    movlt r1, r8 
    movge r1, r4    

    add r6, r6, #1    
    b .loop

.end:
    mov r0, r5
    pop {r4, r5, r6, r7, r8, lr}
    bx lr 