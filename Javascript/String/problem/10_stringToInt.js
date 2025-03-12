// convert string to number
// in javascript we have parseInt
// if string have no valid number than print 0

const val = "5678";
parseInt(val) || 0;

// another approch
function myAtoi(str) {
  const INT_MAX = 2147483647;
  const INT_MIN = -2147483648;

  let i = 0;
  while (i < str.length && str[i] === " ") {
    i++;
  }

  let sign = 1;
  if (str[i] === "+" || str[i] === "-") {
    sign = str[i] === "-" ? -1 : 1;
    i++;
  }

  let num = 0;
  while (i < str.length && /^[0-9]$/.test(str[i])) {
    const digit = parseInt(str[i]);

    // Check for overflow
    if (num > Math.floor((INT_MAX - digit) / 10)) {
      return sign === 1 ? INT_MAX : INT_MIN;
    }

    num = num * 10 + digit;
    i++;
  }

  return num * sign;
}

// Test cases
console.log(myAtoi("42")); // Output: 42
console.log(myAtoi("   -42")); // Output: -42
console.log(myAtoi("4193 with words")); // Output: 4193
console.log(myAtoi("words and 987")); // Output: 0
console.log(myAtoi("-91283472332")); // Output: -2147483648 (INT_MIN)
