// sliding window  [O(n2)]
const longestUniqueSubsttr = (word) => {
    let highestCount = 0;
    let matchWord = "";
    
    for(let i=0; i<word.length; i++){
        const proof = new Array(256)
        let count = 0;

        for(let j=i; j<word.length; j++){
            if(proof[word.charCodeAt(j)]===true){
                break;
            }
            else {
                proof[word.charCodeAt(j)] = true;
                count+=1
            }
        }

        if(count>highestCount) {
            highestCount = count;
            matchWord = word.slice(i,count+i)
        }

    }

    console.log({highestCount,matchWord})
    
}

longestUniqueSubsttr("geeksforgeeks")