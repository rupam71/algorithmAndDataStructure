// JAVAscript program to check if two strings
// are anagrams of each other

let NO_OF_CHARS = 256;

/* function to check whether two strings
    are anagram of each other */
function areAnagram(str1, str2) {
  // Create 2 count arrays and initialize
  // all values as 0
  let count1 = new Array(NO_OF_CHARS);
  let count2 = new Array(NO_OF_CHARS);
  for (let i = 0; i < NO_OF_CHARS; i++) {
    count1[i] = 0;
    count2[i] = 0;
  }

  let i;

  // For each character in input strings,
  // increment count in the corresponding
  // count array
  for (i = 0; i < str1.length && i < str2.length; i++) {
    count1[str1[i].charCodeAt(0)]++;
    count2[str1[i].charCodeAt(0)]++;
  }

  // If both strings are of different length.
  // Removing this condition will make the program
  // fail for strings like "aaca" and "aca"
  if (str1.length != str2.length) return false;

  // Compare count arrays
  for (i = 0; i < NO_OF_CHARS; i++) if (count1[i] != count2[i]) return false;

  return true;
}

/* Driver code*/
let str1 = "gram".split("");
let str2 = "arm".split("");

// Function call
if (areAnagram(str1, str2)) document.write("The two strings are" + "anagram of each other<br>");
else document.write("The two strings are not" + " anagram of each other<br>");

// This code is contributed by avanitrachhadiya2155
