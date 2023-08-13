// Given two strings str1 and str2 of length M and N respectively 
// and below operations that can be performed on str1. 
// Find the minimum number of edits (operations) to convert ‘str1‘ into ‘str2‘.  

// Operation 1 (INSERT): Insert any character before or after any index of str1
// Operation 2 (REMOVE): Remove a character of str1
// Operation 3 (Replace): Replace a character at any index of str1 with some other character.

// check this link https://www.geeksforgeeks.org/edit-distance-dp-5/

// When the last characters of strings matches. Make a recursive call EditDistance(M-1,N-1) to calculate 
// the answer for remaining part of the strings.

// When the last characters of strings don’t matches. Make three recursive calls as show below:

// 1. Insert str1[N-1] at last of str2 : EditDistance(M, N-1)
// 2. Replace str2[M-1] with str1[N-1] : EditDistance(M-1, N-1)
// 3. Remove str2[M-1] : EditDistance(M-1, N)

// Recurrence Relations for Edit Distance:
// 1. EditDistance(str1, str2, M, N) = EditDistance(str1, str2, M-1, N-1)
// 2. Case 1: When the last character of both the strings are same
// 3. Case 2: When the last characters are different
// 4. EditDistance(str1, str2, M, N) = 1 + Minimum{ EditDistance(str1, str2 ,M-1,N-1), EditDistance(str1, str2 ,M,N-1), EditDistance(str1, str2 ,M-1,N) }

// Base Case for Edit Distance:
// 1. Case 1: When str1 becomes empty i.e. M=0
// 2. return N, as it require N characters to convert an empty string to str1 of size N
// 3. Case 2: When str2 becomes empty i.e. N=0
// 4. return M, as it require M characters to convert an empty string to str2 of size M

// ----------------------------------------------
// --------------- PROBLEM SOLVED ---------------
// ----------------------------------------------

// Javascript program to
// find minimum numberoperations
// to convert str1 to str2
function min(x, y, z)
{
    if (x <= y && x <= z)
        return x;
    if (y <= x && y <= z)
        return y;
    else
        return z;
}

function editDist(str1, str2, m, n)
{
    
    // If first string is empty, the 
    // only option is to insert all 
    // characters of second string into first
    if (m == 0)
        return n;

    // If second string is empty, the only
    // option is to remove all characters 
    // of first string
    if (n == 0)
        return m;

    // If last characters of two strings are
    // same, nothing much to do. Get the count for remaining 
    // strings.
    if (str1[m - 1] == str2[n - 1])
        return editDist(str1, str2, m - 1, n - 1);

    // If last characters are not same, consider all
    // three operations on last character of first
    // string, recursively compute minimum cost for all
    // three operations and take minimum of three
    // values.
    return 1 + 
    min(editDist(str1, str2, m, n - 1), // Insert
        editDist(str1, str2, m - 1, n), // Remove
        editDist(str1, str2, m - 1, n - 1)); // Replace
}

// Driver code
let str1 = "sunday";
let str2 = "saturday";

editDist(str1, str2, str1.length, str2.length)