/*

Searching an element in an Array, such as:

Searching in an Unsorted Array using Linear Search
Searching in a Sorted Array using Linear Search
Searching in a Sorted Array using Binary Search


Searching operations in an Unsorted Array using Linear Search
    In an unsorted array, the search operation can be performed by linear traversal from the first element to the last element,
    Time Complexity: O(N) 
    Auxiliary Space: O(1)

Searching in a Sorted Array using Linear Search
    Time Complexity: O(N) 
    Auxiliary Space: O(1)

Searching in a Sorted Array using Binary Search
    Time Complexity: O(log(n)) Using Binary Search
    Auxiliary Space: O(log(n)) due to recursive calls, otherwise iterative version uses Auxiliary Space of O(1).
*/

/*

Deleting an element from an Array, such as:

Deleting Elements from an Array when it is Unsorted
    Run a loop,
    delete element
    and shift all remaining element -1 index
    Time Complexity: O(N) 
    Auxiliary Space: O(1)

Deleting Elements from an Array when it is Sorted
    In the delete operation, the element to be deleted is searched using binary search, and then the delete operation is performed followed by shifting the elements.
    Time Complexity: O(N). In the worst case all elements may have to be moved
    Auxiliary Space: O(log N). An implicit stack will be used

*/

/*

Linear Search 
    function search(arr, n, x) 
    { 
        for (let i = 0; i < n; i++) 
            if (arr[i] == x) 
                return i; 
        return -1; 
    } 
    Complexity Analysis of Linear Search:
        Time Complexity:
            Best Case: In the best case, the key might be present at the first index. So the best case complexity is O(1)
            Worst Case: In the worst case, the key might be present at the last index i.e., opposite to the end from which the search has started in the list. So the worst-case complexity is O(N) where N is the size of the list.
            Average Case: O(N)
        Auxiliary Space: O(1) as except for the variable to iterate through the list, no other variable is used. 
    When to use Linear Search?
        When we are dealing with a small dataset.
        When you are searching for a dataset stored in contiguous memory.

Binary Search
    Complexity Analysis of Binary Search:
            Time Complexity: 
            Best Case: O(1)
            Average Case: O(log N)
            Worst Case: O(log N)
        Auxiliary Space: O(1), If the recursive call stack is considered then the auxiliary space will be O(logN).
    Applications of Binary Search:
        Binary search can be used as a building block for more complex algorithms used in machine learning, such as algorithms for training neural networks or finding the optimal hyperparameters for a model.
        It can be used for searching in computer graphics such as algorithms for ray tracing or texture mapping.
        It can be used for searching a database.
*/