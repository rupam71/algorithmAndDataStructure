/*

Inserting Elements in an Array at the End
    Make a loop, where it end, add new element.
    Time Complexity: O(n)
    Auxiliary Space: O(1)

inserting an element at any position:
    Make a loop, 
    add element in desired position. 
    all remaining element index change to +1
    Before insertion : 2 4 1 8 5 
    After insertion : 2 4 10 1 8 5 
    Time complexity: O(N)
    Auxiliary Space: O(1)

    function insertElement(arr, n, x, pos)
    {
     
        // shift elements to the right
        // which are on the right side of pos
        var i = n - 1;
        for (i; i >= pos; i--)
        {
            arr[i + 1] = arr[i];
        }
        arr[pos] = x;
    }

Inserting Elements in a Sorted Array
    Make a bubble sort and find desired positon. 
    all remaining element index change to +1
    Time Complexity: O(N) [In the worst case all elements may have to be moved] 
    Auxiliary Space: O(1)

    function insertSorted( arr, n, key, capacity)
    {
     
        // Cannot insert more elements if n is already
        // more than or equal to capacity
        if (n >= capacity)
            return n;
 
        var i;
        for (i = n - 1; (i >= 0 && arr[i] > key); i--)
            arr[i + 1] = arr[i];
 
        arr[i + 1] = key;
 
        return (n + 1);
    }
    
*/