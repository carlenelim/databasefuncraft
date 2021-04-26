const express = require("express");
const app = express();
const port = 3000;
const path = require("path");

var mysql = require("mysql");
var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "funcraft",
});

app.get("/", (req, res) => {
    res.send("Hello World!");
});

app.get("/login", (req, res) => { //tolong ini gmn biar bisa boolean dari result nya buat check login
    connection.connect();
    connection.query("SELECT * FROM Accounts WHERE email = ? AND pw = ?", function (err, rows, fields) {
        if (err) throw err;
        console.log(rows);
    });
    connection.end();
});

app.get("/chara", (req, res) => { //tolong ini gmn biar bisa dari input
    connection.connect();
    connection.query("SELECT charaName, charaHp, charaAp, charaExp, jobs_name FROM Chara c JOIN Jobs j ON c.jobs_ID = j.jobs_ID WHERE jobs_ID = ?", function (err, rows, fields) {
        if (err) throw err;
        console.log(rows);
    });
    connection.end();
});


app.get("/quest", (req, res) => { //tolong ini gmn biar bisa dari input
    connection.connect();
    connection.query("SELECT q.questName, q.quantity, a.qtyAchieved FROM Quest q JOIN AssignedQuest a ON q.quest_ID = a.quest_ID WHERE employee_ID = ?", function (err, rows, fields) {
        if (err) throw err;
        console.log(rows);
    });
    connection.end();
});

app.get("/questdetails", (req, res) => { //tolong ini gmn biar bisa dari input
    connection.connect();
    connection.query("SELECT * FROM Quest WHERE quest_ID = ?", function (err, rows, fields) {
        if (err) throw err;
        console.log(rows);
    });
    connection.end();
});

app.get("/agrAchieved", (req, res) => { //tolong ini gmn biar bisa dari input
    connection.connect();
    connection.query("SELECT SUM(agreement_ID) FROM Agreement WHERE employee_ID = ?", function (err, rows, fields) {
        if (err) throw err;
        console.log(rows);
    });
    connection.end();
});


app.get("/reward", (req, res) => { //tolong ini gmn biar bisa dari input
    connection.connect();
    connection.query("SELECT SUM(reward) FROM Agreement WHERE employee_ID = ?", function (err, rows, fields) {
        if (err) throw err;
        console.log(rows);
    });
    connection.end();
});

app.get("/monthly", (req, res) => { //tolong ini gmn biar bisa dari input
    connection.connect();
    connection.query("SELECT SUM(reward) FROM Agreement WHERE employee_ID = ? AND agreementDate BETWEEN ? AND ?", function (err, rows, fields) {
        if (err) throw err;
        console.log(rows);
    });
    connection.end();
});

app.get("/rank", (req, res) => {
    connection.connect();
    connection.query("SELECT emp.fullName, emp.profilePicture, SUM(a.reward) FROM Employee emp JOIN Agreement a on a.employee_ID = emp.employee_ID GROUP BY emp.employee_ID SORT BY SUM(a.reward) DESC", function (err, rows, fields) {
        if (err) throw err;
        console.log(rows);
    });
    connection.end();
});

app.get("/image/user/:imName", (req, res) => {
    res.sendFile(path.join(__dirname, "assets/user/" + req.params["imName"]));
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});
