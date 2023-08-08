// no build in method can be usesd.
let reverseString = (wor) => {
    const word = wor.trim()
    let result = ''

    for(let i=word.length-1; i>=0; i--) {
        result += word[i]
    }

    console.log({result})
}

reverseString("hello World")


// With Build In Function
function reverseString(str) {
    return str.split("").reverse().join("");
}
reverseString("hello");

// with recursive function 
let reverseRecursion = (word) => {
    if(word==="") return "";
    return reverseRecursion(word.slice(1))+word[0]
}

reverseRecursion("hello World now!")