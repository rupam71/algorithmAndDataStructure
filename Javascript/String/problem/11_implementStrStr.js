// second value accurance index in first value

// Approch 1
function strstr(haystack, needle) {
    const index = haystack.indexOf(needle);
    return index !== -1 ? index : -1;
}

console.log(strstr("hello", "ll"));  // Output: 2
console.log(strstr("aaaaa", "bba")); // Output: -1
console.log(strstr("mississippi", "issip")); // Output: 4

// Approch 2
function strstrHardWay(haystack, needle) {
    if (needle === "") {
        return 0;
    }
    
    for (let i = 0; i < haystack.length; i++) {
        if (haystack[i] === needle[0]) {
            let found = true;
            for (let j = 0; j < needle.length; j++) {
                if (i + j >= haystack.length || haystack[i + j] !== needle[j]) {
                    found = false;
                    break;
                }
            }
            if (found) {
                return i;
            }
        }
    }
    
    return -1;
}

// Test cases
console.log(strstrHardWay("hello", "ll"));  // Output: 2
console.log(strstrHardWay("aaaaa", "bba")); // Output: -1
console.log(strstrHardWay("mississippi", "issip")); // Output: 4
