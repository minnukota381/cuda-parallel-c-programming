# CUDA PARALLEL C PROGRAMMING || Minnu
This repository contains various CUDA C programs demonstrating parallel computing techniques using NVIDIA's CUDA platform.

## Programs Overview

- **[Addition of Two Numbers](#addition-of-two-numbers)**
- **[Even or Odd](#even-or-odd)**
- **[Matrix Multiplication](#matrix-multiplication)**
- **[Using Threads](#using-threads)**

## Addition of Two Numbers

This program demonstrates basic addition of two numbers using CUDA kernels.

### Files

- `kernel.cu`: CUDA source file for addition of two numbers.

### Usage

1. **Compile the program:**

   ```bash
   nvcc kernel.cu -o addition_cuda
   ```

2. **Run the program:**

   ```bash
   ./addition_cuda
   ```

3. **Input:**

   Follow the on-screen instructions to input two integers.

4. **Output:**

   The program will compute the sum using CUDA and display the result.

## Even or Odd

This program determines if a number is even or odd using CUDA.

### Files

- `kernel.cu`: CUDA source file for even or odd determination.

### Usage

1. **Compile the program:**

   ```bash
   nvcc kernel.cu -o even_odd_cuda
   ```

2. **Run the program:**

   ```bash
   ./even_odd_cuda
   ```

3. **Input:**

   Enter a number when prompted.

4. **Output:**

   The program will use CUDA to check if the number is even or odd and display the result.

## Matrix Multiplication

This program performs matrix multiplication using CUDA for parallel computation.

### Files

- `kernel.cu`: CUDA source file for matrix multiplication.

### Usage

1. **Compile the program:**

   ```bash
   nvcc kernel.cu -o matrix_mult_cuda
   ```

2. **Run the program:**

   ```bash
   ./matrix_mult_cuda
   ```

3. **Input:**

   Adjust the matrix dimensions and values directly in the `kernel.cu` file as needed.

4. **Output:**

   The program will use CUDA to perform matrix multiplication and display the resulting matrix.

## Using Threads

This program demonstrates CUDA programming with multiple threads.

### Files

- `kernel.cu`: CUDA source file demonstrating thread usage.

### Usage

1. **Compile the program:**

   ```bash
   nvcc kernel.cu -o threads_cuda
   ```

2. **Run the program:**

   ```bash
   ./threads_cuda
   ```

3. **Input/Output:**

   Follow the specific instructions provided within the `kernel.cu` file for thread management and usage.

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature`)
3. Make your changes
4. Commit your changes (`git commit -am 'Add feature'`)
5. Push to the branch (`git push origin feature`)
6. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

