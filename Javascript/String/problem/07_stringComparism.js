// https://www.geeksforgeeks.org/check-if-string-s-can-be-compressed-to-t-by-replacing-some-x-characters-with-count-x/

// Input: S = “HELLOWORLD”  T=”H2L4L1″
// Output: True
// Explanation:
// Replace index 1 to 2 in “HELLOWORLD” with count 2 -> “H2LOWORLD”
// Replace index 4 to 7 in “HELLOWORLD” with count 4 -> “H2L4LD”
// Replace index 9 in “HELLOWORLD” with count 1 -> “H2L4L1“
// The resultant string is same as T. Hence String S can be compressed to T.

// Follow the below steps to solve the problem:

// Start Traversing S and T string until its length simultaneously.
// Check whether T[i] is number or not, if it is not a number then compare S[j] and T[i] if they are not equal then directly return 0 else continue and increment j by 1 .
// If T[i] is a number then increase the j to that number until we get numbers in T string .
// Increment i by 1 until length of T.
// If j is not equal to S of length then return 0.
// If all conditions are satisfied then return 1 at last.

function isnum(c) {
  return c >= 48 && c <= 57;
}

let checkCompressed = (str, ter) => {
  let i = 0;
  let j = 0;
  let result = true;

  while (i < str.length && j < ter.length) {
    console.log(str[i], ter[j]);

    if (isnum(ter[j].charCodeAt())) {
      if (str[i + parseInt(ter[j])] === ter[j + 1]) {
        i = i + parseInt(ter[j]);
        j = j + 1;
      } else {
        result = false;
        break;
      }
    } else if (str[i] !== ter[j]) {
      result = false;
      break;
    } else {
      i++;
      j++;
    }
  }

  return result;
};

let S = "HelloWorld";
let T = "H2l4l1";
checkCompressed(S, T);
