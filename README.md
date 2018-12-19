# SVM_SMO
Pseudo-Code for Simplified SMO
In this section we present pseudo-code for the simplified SMO algorithm. This should help you
get started with your implementation of the algorithm for problem set #2.
Algorithm: Simplified SMO
Input:
C: regularization parameter
tol: numerical tolerance
max passes: max # of times to iterate over α’s without changing
(x
(1), y(1)), . . . ,(x
(m)
, y(m)
): training data
Output:
α ∈ R
m: Lagrange multipliers for solution
b ∈ R : threshold for solution
◦ Initialize αi = 0, ∀i, b = 0.
◦ Initialize passes = 0.
◦ while (passes < max passes)
◦ num changed alphas = 0.
◦ for i = 1, . . . m,
◦ Calculate Ei = f(x
(i)
) − y
(i) using (2).
◦ if ((y
(i)Ei < −tol && αi < C) || (y
(i)Ei > tol && αi > 0))
◦ Select j 6= i randomly.
◦ Calculate Ej = f(x
(j)
) − y
(j) using (2).
◦ Save old α’s: α
(old)
i = αi
, α
(old)
j = αj .
◦ Compute L and H by (10) or (11).
◦ if (L == H)
continue to next i.
◦ Compute η by (14).
◦ if (η >= 0)
continue to next i.
◦ Compute and clip new value for αj using (12) and (15).
◦ if (|αj − α
(old)
j
| < 10−5
)
continue to next i.
◦ Determine value for αi using (16).
◦ Compute b1 and b2 using (17) and (18) respectively.
◦ Compute b by (19).
◦ num changed alphas := num changed alphas + 1.
◦ end if
◦ end for
◦ if (num changed alphas == 0)
passes := passes + 1
◦ else
passes := 0
◦ end while
CS229 Simplified SMO Algorithm 5
References
[1] Platt, John. Fast Training of Support Vector Machines using Sequential Minimal Optimization, in Advances in Kernel Methods – Support Vector Learning, B. Scholkopf, C. Burges,
A. Smola, eds., MIT Press (1998).
