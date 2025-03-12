// Given a string s1 and a string s2, write a function to check whether 
// s2 is a rotation of s1. 

// Examples: 
// Input: S1 = ABCD, S2 = CDAB
// Output: Strings are rotations of each other

// Input: S1 = ABCD, S2 = ACBD
// Output: Strings are not rotations of each other

// Approach
// if 2 string length are not same, they not match
// find first char of first arr in second arr.
// then loop throw to check all string if(s1[i] !== s2[(i+firstCharFoundInSecondArr)%s2.length])
// O(N^2)
const stringRotationCheck = (s1,s2) => {
    let isRotable = true; 

    if(s1.length!==s2.length) return isRotable = false;

    let firstChar = s1[0]
    let firstCharFoundInSecondArr = -1

    for(let i =0; i<s2.length; i++) {
        if (s2[i] === firstChar) {
            firstCharFoundInSecondArr = i;
            break;
        }
    }

    console.log({firstCharFoundInSecondArr})

    for(let i=0; i<s1.length; i++) {
        if(s1[i] !== s2[(i+firstCharFoundInSecondArr)%s2.length]) isRotable = false
    }

    return isRotable;
}

stringRotationCheck("asbcd","cdsab")

// approch
// add s1 with s1
// if s2 found in new (s1+s1) its rotable
// O(N)
const stringRotationCheckLinearTime = (s1,s2) => {
    let isRotable = true; 

    if(s1.length!==s2.length) return isRotable = false;
    if((s1+s1).indexOf(s2) === -1) return isRotable = false

    return isRotable;
}

stringRotationCheckLinearTime("sabcd","cdsab")

// approch
// first find first char index in ohter arr
// now check, first arr prefix and second arr suffex
// again check first arr suffex and second arr prefex
// O(N)
const stringRotationCheckSuffexPreffix = (s1,s2) => {
    if(s1.length!==s2.length) return false;
    else {
        for(let i=0; i<s1.length; i++){
            if(s2[0] === s1[i]) {
                if(s1.slice(i) === s2.slice(0,s2.length-i)) {
                    if(s1.slice(0,i) === s2.slice(s2.length-i)) return true
                }
            }
        }
    }

    return false;
}

stringRotationCheckSuffexPreffix("sabcd","cdsab")