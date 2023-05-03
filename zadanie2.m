% b(i, j) jeśli j ma odnośnik do i (j -> i)
N = 7;

% zadanie A
Edges =  [
    1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7; ...
    4, 6, 3, 4, 5, 5, 6, 7, 5, 6, 4, 6, 4, 7, 6];

% zadanie B
B = sparse(Edges(2,:), Edges(1,:), ones(), N, N);
L = sum(B);
A = spdiags(transpose(1./L), 0, N, N);
I = speye(N);
d = 0.85;
M = I - d*B*A;
b(1:N, 1) = (1-d)/N;

% zadanie C
whos A B I M b;
f = fopen('sparse_test.txt','w');
%fprintf(f,'%s', (whos A B I M b));
fclose(f);

% zadanie D
spy(B);
title("Sieć stron");
print -dpng spy_b;

% zadanie E
r = M\b;

% zadanie F
bar(r);
title("PageRank");
xlabel("numer strony");
ylabel("wartość");
print -dpng bar;