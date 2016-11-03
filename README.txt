1. vlfeat not included in the submission. The user MUST download vlfeat in order to successfully run this project.

2. For graduate credit, normalization has been performed on the matching interest points for Fundamental Matrix estimation. A function named 
Normalized_estimate_fundamental_matrix implements this.

3. The function estimate_fundamental_matrix implements estimation of fundamental matrix without normalization of matching points.

4. To implement Normalized_estimate_fundamental_matrix, uncomment the function call in proj3_part2.m and comment out the function call to estimate_fundamental_matrix.

5. To implement estimate_fundamental_matrix, uncomment the function call in proj3_part2.m and comment out Normalized_estimate_fundamental_matrix function all.

6. proj3_part3.m calls ransac_fundamental_matrix which in turn uses Normalized_estimate_fundamental_matrix. There is no need for the user to modify the function call here.

7. The threshold remains same for all the images.