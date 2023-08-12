// Given an expression string exp, write a program to examine whether the pairs 
// and the orders of “{“, “}”, “(“, “)”, “[“, “]” are correct in the given expression.

// Example: 

// Input: exp = “[()]{}{[()()]()}” 
// Output: Balanced
// Explanation: all the brackets are well-formed

// Input: exp = “[(])” 
// Output: Not Balanced 
// Explanation: 1 and 4 brackets are not balanced because 
// there is a closing ‘]’ before the closing ‘(‘

// Using Array 
// if found ( { [ add in array
// if found ) and last in stack is ( than pop()
// if found } and last in stack is { than pop()
// if found ] and last in stack is [ than pop()
// lastly if stack length is 0 its valid pranthesis
// if stack have length > 0 its not valid pranthesis
// O(N)

const validPranthesis = (s) => {
    let stack = []
    
    for(let i=0; i<s.length;i++) {
        if(s[i]==="(" || s[i]==="{" || s[i]==="[") stack.push(s[i])
        else if(s[i] === ")" && stack[stack.length-1] === "(") stack.pop()
        else if(s[i] === "}" && stack[stack.length-1] === "{") stack.pop()
        else if(s[i] === "]" && stack[stack.length-1] === "[") stack.pop()
    }

    if(stack.length) return false;
    else return true;
}

validPranthesis("({[]})")