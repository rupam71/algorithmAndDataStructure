// Javascript program to check if two strings
// are anagrams of each other
let NO_OF_CHARS = 256;
 
// function to check if two strings
// are anagrams of each other
function areAnagram(str1, str2)
{
    // If both strings are of different
    // length. Removing this condition
    // will make the program fail for
    // strings like "aaca" and "aca"
    if (str1.length != str2.length)
        return false;
 
    // Create a count array and initialize
    // all values as 0
    let count = new Array(NO_OF_CHARS);
    for(let i = 0; i < NO_OF_CHARS; i++)
    {
        count[i] = 0;
    }
    let i;
  
    // For each character in input strings,
    // increment count in the corresponding
    // count array
    for(i = 0; i < str1.length; i++)
    {
        count[str1[i].charCodeAt(0) - 'a'.charCodeAt(0)]++;
        count[str2[i].charCodeAt(0) - 'a'.charCodeAt(0)]--;
    }
  
    // See if there is any non-zero
    // value in count array
    for(i = 0; i < NO_OF_CHARS; i++)
        if (count[i] != 0)
        {
            return false;
        }
    return true;
}
 
// Driver code
let str1 = "gram".split("");
let str2 = "arm".split("");
 
// Function call
if (areAnagram(str1, str2))
    document.write("The two strings are " +
                 "anagram of each other");
else
    document.write("The two strings are " +
                 "not anagram of each other");