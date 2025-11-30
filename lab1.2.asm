global mean

section .text

; uint64_t mean(uint32_t *arr, uint32_t n, uint32_t m)
; rdi = arr
; rsi = n
; rdx = m (далее - r9)
; rax - return
mean:
    mov rax, 0 ; rax = result = 0
    mov r9, rdx ; потому что rdx будет использоваться в делении
    mov rcx, 0 ; rcx = i = 0

for_i: 
    cmp rcx, rsi ; rcx = i, rsi = n
    jge end ; if rcx >= rsi: return
    mov r10, 0 ; r10 = j = 0

for_j:
    cmp r10, r9
    jge for_j_end

    mov r11, rcx ; r11 = i
    imul r11, r9 ; r11 = i * m
    add r11, r10 ; r11 = i * m + j

    mov r8d, dword [rdi + r11 * 4] ; r8d = arr[*arr + (i * m + j) * sizeof(int)]
    add rax, r8 ; sum = sum + a[i][j]

    inc r10 ; j++
    jmp for_j

for_j_end:
    inc rcx ; i++
    jmp for_i

end:
    mov rdx, 0
    div r9
    ; rax -> return result
    ret