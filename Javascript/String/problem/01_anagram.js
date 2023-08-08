// An anagram of a string is another string that contains the same characters, 
// only the order of characters can be different. For example, “abcd” and “dabc” 
// are an anagram of each other.

import { sortString } from "../GeneralSolution/sortString";

// Input: str1 = “listen”  str2 = “silent”
// Output: “Anagram”
// Explanation: All characters of “listen” and “silent” are the same.

// Input: str1 = “gram”  str2 = “arm”
// Output: “Not Anagram”

const areAnagram = (str1,str2) => {
    // Get lengths of both strings
    let n1 = str1.length;
    let n2 = str2.length;

    // If length of both strings is not same,
    // then they cannot be anagram
    if (n1 != n2)
        return false;

    // Sort both strings
    const firstAnagram = sortString(str1)
    const secondAnagram = sortString(str2)

    if(firstAnagram === secondAnagram) return true;
    else return false;
}
