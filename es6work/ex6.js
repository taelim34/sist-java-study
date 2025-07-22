console.log(new Array(5));  //배열5개 생성
console.log(...new Array(5));  //배열5개 생성
console.log(Array.from(Array(5).keys));

const arr=Array.from({length:5},(_,i)=>i+1);
console.log(arr);