int i = 2;
int F[13];

int main() {
    F[0] = 0;
    F[1] = 1;
    while (i < 13) {
        F[i] = F[i-1] + F[i-2];
        i++;
    }

    return F[12];
}
