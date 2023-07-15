# division_algoritm
Design and implementation of the slow and fast division algorithm
Restoring division algorithms are used in computer architecture to perform division operations. There are two common variations of restoring division algorithms: slow restoring and fast restoring. Both algorithms aim to divide a dividend by a divisor and produce the quotient and remainder.

Slow Restoring Division Algorithm:
The slow restoring division algorithm is a simple and straightforward method for division. It operates bit by bit, examining the dividend and divisor to determine the quotient and remainder. Here's a high-level overview of the algorithm:
Step 1: Initialize the quotient and remainder to zero.
Step 2: Compare the dividend (the number being divided) with the divisor (the number dividing the dividend).
Step 3: If the dividend is greater than or equal to the divisor, subtract the divisor from the dividend and set the least significant bit of the quotient to 1.
Step 4: If the dividend is less than the divisor, set the least significant bit of the quotient to 0.
Step 5: Shift the quotient and remainder one bit to the left.
Step 6: Shift the dividend one bit to the left and bring down the next bit.
Step 7: Repeat steps 2-6 until all bits of the dividend have been processed.
Step 8: The quotient obtained is the final result.
The slow restoring division algorithm is called "slow" because it performs multiple iterations to process each bit of the dividend. It can take a longer time to compute the division compared to other division algorithms.

Fast Restoring Division Algorithm:
The fast-restoring division algorithm is an optimized version of the slow-restoring algorithm. It reduces the number of iterations required to perform the division, resulting in faster computation. The key difference between the fast and slow restoring algorithms lies in steps 3 and 4.
In the fast restoring algorithm, after subtracting the divisor from the dividend in step 3, instead of immediately shifting the dividend and proceeding to the next bit, an additional adjustment is made. This adjustment involves adding the divisor back to the intermediate result obtained in step 3. The purpose of this adjustment is to expedite the convergence of the algorithm.

By performing the adjustment, the fast restoring algorithm aims to ensure that the divisor is approximately centered within the remaining bits of the dividend, increasing the chances of subsequent subtraction steps being successful. This reduces the number of iterations needed to complete the division.

Overall, the fast restoring division algorithm improves the speed of the division operation compared to the slow restoring algorithm. However, it requires additional hardware resources to perform the adjustment in step 3, making it more complex to implement in hardware designs.

Both slow-restoring and fast-restoring division algorithms are fundamental techniques used in computer architectures to perform division operations efficiently. The choice between them depends on factors such as hardware constraints, performance requirements, and trade-offs between implementation complexity and speed.





