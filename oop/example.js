const events = [
    { start: 1, end: 3 },
    { start: 2, end: 9 },
    { start: 3, end: 5 },
    { start: 2, end: 4 },
    { start: 4, end: 6 }
  ];

  const maxEvents = (events) => {
    let currenEnd = events[0].end;
    let count = 1;

    for(let i=1; i<events.length; i++) {
        if(events[i].start >= currenEnd) {
            count++;
            currenEnd = events[i].end;
        }
    }

    return count;
  }
  
  console.log(maxEvents(events)); // Should output: 2