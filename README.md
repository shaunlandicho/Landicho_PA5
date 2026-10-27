# Landicho_PA5

# ECE-2112-PA-5

Made by: Shaun Jakob Landicho | 2ECE-A

The content of this repository contains the MATLAB script and output for Experiment 5: "Introduction to MATLAB Programming" for our course "Advanced Computer Programming and Algorithms" for S.Y. 2025–2026. This assignment covers two MATLAB problems pertaining to matrix transpose operations and solving systems of linear equations using multiple numerical methods.

---

# 1. Problem A: Transpose Operations

Explore and compare different matrix transpose operators (`transpose()`, `'`, and `.'`) applied to both real-valued and complex-valued matrices in MATLAB.

### Functions and Operators Used:

- `transpose(Matrix)` – A built-in MATLAB function that computes the non-conjugate transpose of a matrix (swapping rows and columns without negating imaginary components).
  - Example: `transpose(Z)`
- `.'` (Array Transpose) – An operator that performs a non-conjugate transpose. For real matrices, it behaves identically to the regular transpose; for complex matrices, it transposes without conjugating.
  - Example: `Z.'`
- `'` (Complex Conjugate Transpose / Hermitian Transpose) – An operator that transposes the matrix and replaces each element with its complex conjugate (negates the imaginary component).
  - Example: `Z'`

### Code Implementation:

```matlab
% Real Matrix Definition
R = [ 5 -2  0  7;
      1  3 -4  2;
      6  0  8 -1];

disp('Matrix R:');      disp(R)
disp('transpose(R):'); disp(transpose(R))
disp('R'':');          disp(R')
disp('R.'':');         disp(R.')

% Complex Matrix Definition
Z = [ 2+3i  -1+4i   5-2i; 
     -3+1i   6      2+5i];

disp('Matrix Z:');      disp(Z)
disp('transpose(Z):'); disp(transpose(Z))
disp('Z'':');          disp(Z')
disp('Z.'':');         disp(Z.')
```

### Analysis & Questions Answered:

- a. Which operations give identical results for the real matrix $R$?
  - All three operations (`transpose(R)`, `R'`, and `R.'`) produce identical results for the real matrix $R$ because all matrix elements are purely real (imaginary component is zero).

- b. Which two operations give identical results for the complex matrix $Z$?
  - The operations `transpose(Z)` and `Z.'` produce identical results for the complex matrix $Z$. Both perform a non-conjugate transpose, swapping rows and columns while leaving complex values unchanged.

- c. What additional operation is performed by the apostrophe operator (`'`) when the matrix contains complex entries?
  - The apostrophe operator (`'`) computes the complex-conjugate transpose. In addition to swapping the rows and columns, it negates the imaginary component of every complex entry (e.g., $2 + 3i$ becomes $2 - 3i$).

---

# 2. Problem B: Two Methods for a Linear System

Solve a system of linear equations $A x = b$ using two distinct mathematical methods in MATLAB—the Matrix Inverse Method and Cramer's Rule—and verify numerical precision.

### Given Linear System:

$$
\begin{bmatrix}
2 & -1 & 3 & 2 \\
1 & 4 & -2 & 1 \\
3 & 2 & 1 & -1 \\
-2 & 3 & 4 & 2
\end{bmatrix}
\begin{bmatrix}
x_1 \\ x_2 \\ x_3 \\ x_4
\end{bmatrix}
=
\begin{bmatrix}
16 \\ -7 \\ 6 \\ 7
\end{bmatrix}
$$

### Functions and Methods Used:

- `det()` – Computes the determinant of a square matrix.
  - Example: `det(A)`
- `inv()` – Calculates the matrix inverse $A^{-1}$.
  - Example: `x_inv = inv(A) * b`
- `norm()` – Measures vector norm / magnitude to check precision and residual errors.
  - Example: `norm(x_inv - x_cramer)`

### Code Implementation:

```matlab
% Coefficient Matrix A and RHS Vector b
A = [ 2 -1  3  2;
      1  4 -2  1;
      3  2  1 -1;
    -2  3  4  2];

b = [16; -7; 6; 7];

% Determinant of Matrix A
disp('Determinant det(A):');
disp(det(A));

% Solution Method 1: Matrix Inverse
x_inv = inv(A) * b;
disp('x_inv:');
disp(x_inv);

% Solution Method 2: Cramer's Rule
A1 = A; A1(:, 1) = b;
A2 = A; A2(:, 2) = b;
A3 = A; A3(:, 3) = b;
A4 = A; A4(:, 4) = b;

x_cramer = [det(A1); det(A2); det(A3); det(A4)] / det(A);
disp('x_cramer:');
disp(x_cramer);

% Numerical Precision Analysis
disp('Precision Check - norm(x_inv - x_cramer):');
disp(norm(x_inv - x_cramer));

disp('Residual Check - norm(A * x_inv - b):');
disp(norm(A * x_inv - b));
```

### Results Summary:

- Determinant $\text{det}(A)$: $280$
- Solution Vector $x$: 
  $$x = \begin{bmatrix} 2.0000 \\ -1.0000 \\ 3.0000 \\ 1.0000 \end{bmatrix}$$
- Difference Norm $\|x_{\text{inv}} - x_{\text{cramer}}\|$: $7.6919 \times 10^{-16}$
- Residual Norm $\|A x_{\text{inv}} - b\|$: $4.3512 \times 10^{-15}$

Both methods yield identical results within floating-point tolerance, confirming numerical precision.

Thank you for reading!

