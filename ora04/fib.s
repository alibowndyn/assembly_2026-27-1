    .intel_syntax noprefix
    .globl main
    .globl F, i

        .data
i:      .4byte  2
        .comm   F, 52

        .text
main:   mov     DWORD PTR [F],      0       # F[0] = 0
        mov     DWORD PTR [F+4],    1       # F[1] = 1

        jmp     COND

BODY:   mov     eax, DWORD PTR [i]
        dec     eax
        mov     ebx, DWORD PTR [F + eax*4]  # ebx=F[i-1]

        mov     eax, DWORD PTR [i]
        sub     eax, 2
        mov     edx, DWORD PTR [F + eax*4]  # edx=F[i-2]

        add     ebx, edx                    # F[i-1] + F[i-2]

        mov     eax, DWORD PTR [i]
        mov     DWORD PTR [F + eax*4], ebx  # F[i]=

        mov     eax, DWORD PTR [i]
        inc     eax                         # i++
        mov     DWORD PTR [i], eax

COND:   mov     eax, DWORD PTR [i]
        cmp     eax, 13
        jl      BODY

        mov     rbx, 12
        mov     eax, DWORD PTR [F + rbx*4]  # eax = F[12]
        ret
