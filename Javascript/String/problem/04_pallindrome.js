// Given a positive integer, write a function that returns true if 
// the given number is a palindrome, else false. 
// For example, 12321 is a palindrome, but 1451 is not a palindrome. 



let n = "abcdclba";

// convert to string; specialy for number
n = n.toString()
let result = true;

for(let i=0; i<n.length;i++) {
    if(n[i] !== n[(n.length-1)-i]) {
        result = false;
        break;
    }    
}

console.log({result})


// 2nd method
function checkPalindrome(x) {
    let convertedNumber = x.toString();
    let reverseString = convertedNumber.split("").reverse().join("");
    return reverseString === convertedNumber ? "Yes" : "No";
}
 
// Some Testcases...
let num = 12321;
console.log(checkPalindrome(num)); // Yes
 
let number = 456;
console.log(checkPalindrome(number)); // No

