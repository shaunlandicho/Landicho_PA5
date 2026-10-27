% ECE 2112 - Advanced Computer Programming and Algorithms
% Experiment 5: Introduction to MATLAB Programming 
% Shaun Jakob Landicho
% 2ECE-A


%% PROBLEM A: TRANSPOSE OPERATIONS
('PROBLEM A')
R = [ 5 -2  0  7;
    1  3 -4  2;
    6  0  8 -1];

% Display matrix R and its transpose forms
('Matrix R:')
(R)

('transpose (R):')
(transpose(R))

R
R')

'R.'':'
R.'

Z = [ 2+3i  -1+4i   5-2i; -3+1i   6      2+5i];


('Matrix Z:')
(Z)

('transpose(Z):')
transpose(Z)

('Z'':')
Z'

('Z.'':')
Z.'

% Answer the following in MATLAB comments below your output:
% a. Which operations give identical results for the real matrix R?
% - All of the three operations produce identical results for the real matrix R because all elements 
%    are purely real.
%
% b. Which two operations give identical results for the complex matrix Z?
% - The operations (transpose(Z) and Z.') give similar results for the complex 
%    matrix Z. Both compute the non-conjugate transpose.
%
% c. What additional operation is performed by the apostrophe operator (')
%    when the matrix contains complex entries?
% - It computes the complex-conjugate transpose. Aside from swapping rows and columns,
%    it also negates the imaginary component of each complex element.

%% PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM

% coefficient matrix A and right-hand-side vector b.
('PROBLEM B')
A = [ 2 -1  3  2;
      1  4 -2  1;
      3  2  1 -1;
    -2  3  4  2];
('Coefficient matrix A:')
A

b = [16; -7; 6; 7];
('Right-hand-side vector b:')
b

% Determinant A
('Determinant of matrix A, det(A):');
det(A);

('Two Solution Vectors:')
% Inverse Method
x_inv = inv(A) * b;
('x_inv:');
x_inv;

% Cramer's Rule
A1 = A; A1(:, 1) = b;
A2 = A; A2(:, 2) = b;
A3 = A; A3(:, 3) = b;
A4 = A; A4(:, 4) = b;

x_cramer = [det(A1); 
            det(A2); 
            det(A3); 
            det(A4)] / det(A);

('x_cramer:');
x_cramer;

% Numerical precision
('Numerical precision')

('norm(x_inv-x_cramer):')
norm(x_inv-x_cramer)

('norm(A * x_inv - b):');
norm(A * x_inv - b);

% RESULTS OF THE CODE:

PROBLEM A
Matrix R:
     5    -2     0     7
     1     3    -4     2
     6     0     8    -1

transpose (R):
     5     1     6
    -2     3     0
     0    -4     8
     7     2    -1

R':
     5     1     6
    -2     3     0
     0    -4     8
     7     2    -1

R.':
     5     1     6
    -2     3     0
     0    -4     8
     7     2    -1

Matrix Z:
   2.0000 + 3.0000i  -1.0000 + 4.0000i   5.0000 - 2.0000i
  -3.0000 + 1.0000i   6.0000 + 0.0000i   2.0000 + 5.0000i

transpose(Z):
   2.0000 + 3.0000i  -3.0000 + 1.0000i
  -1.0000 + 4.0000i   6.0000 + 0.0000i
   5.0000 - 2.0000i   2.0000 + 5.0000i

Z':
   2.0000 - 3.0000i  -3.0000 - 1.0000i
  -1.0000 - 4.0000i   6.0000 + 0.0000i
   5.0000 + 2.0000i   2.0000 - 5.0000i

Z.':
   2.0000 + 3.0000i  -3.0000 + 1.0000i
  -1.0000 + 4.0000i   6.0000 + 0.0000i
   5.0000 - 2.0000i   2.0000 + 5.0000i

-------------PROBLEM B-------------
Coefficient matrix A:
     2    -1     3     2
     1     4    -2     1
     3     2     1    -1
    -2     3     4     2

Right-hand-side vector b:
    16
    -7
     6
     7

Determinant of matrix A, det(A):
   280

Two Solution Vectors:
x_inv:
    2.0000
   -1.0000
    3.0000
    1.0000

x_cramer:
    2.0000
   -1.0000
    3.0000
    1.0000

Numerical precision
norm(x_inv-x_cramer):
   7.6919e-16

norm(A * x_inv - b):
   4.3512e-15

