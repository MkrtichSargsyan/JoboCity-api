const a =async (url)=>{
  const options = {
    method: 'GET',
    mode:'cors',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  };
  const aa =await fetch(url,options).then(data=>data.json());
  console.log(aa);

}





a('http://localhost:3000/jobs')
// a('https://jsonplaceholder.typicode.com/todos/1')