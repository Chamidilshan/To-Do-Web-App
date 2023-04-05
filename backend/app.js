const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.urlencoded({extended: true}));

// Add CORS middleware
app.use(function(req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  next();
});

let tasks = [
  {id: 1, text:'Make a call'},
  {id: 2, text:'Send an email'},
  {id: 3, text:'Buy groceries'},
];

app.get('/api/tasks', (req, res) => {
  let today = new Date();
  console.log(today); 
  res.json(tasks);
});

app.post('/api/tasks', (req, res) => {
    const newTask = {
        id: tasks.length + 1, 
        text: req.body.text,
    };
    tasks.push(newTask);
    res.json(newTask); 
});

app.listen(3000, () => console.log('server is running'));
 