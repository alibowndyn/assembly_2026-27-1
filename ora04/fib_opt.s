    .intel_syntax noprefix
    .globl main
    .globl F, i

        .data
        .comm   F, 52
i:      .4byte  2

        .text
main:   mov     DWORD PTR [F],      0           # F[0] = 0
        mov     DWORD PTR [F+4],    1           # F[1] = 1

        jmp     COND

BODY:   mov     eax, DWORD PTR [i]
        mov     ebx, DWORD PTR [F + eax*4 - 4]  # ebx=F[i-1]

        mov     edx, DWORD PTR [F + eax*4 - 8]  # edx=F[i-2]
        add     ebx, edx                        # F[i-1] + F[i-2]

        mov     eax, DWORD PTR [i]
        mov     DWORD PTR [F + eax*4], ebx      # F[i]=

        inc     DWORD PTR [i]                   # i++

COND:   cmp     DWORD PTR [i], 13
        jl      BODY

        mov     eax, DWORD PTR [F + 12*4]       # eax = F[12]
        ret
