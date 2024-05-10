// Includes
// ---------------------------------------------------------------------
require('dotenv').config();
const express = require('express');
let jwt = require('jsonwebtoken');
const app = new express();
let mysql = require('mysql');

let pool  = mysql.createPool({
  connectionLimit : 10,
  host            :  process.env.DBHOST,
  user            :  process.env.DBUSER,
  password        :  process.env.DBPASS,
  database        :  process.env.DBNAME,
});

// Constants
// ---------------------------------------------------------------------
const port = process.env.PORT;
const acces_token = process.env.TOKEN_SECRET;

// Middlewares
// ---------------------------------------------------------------------
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Endpoints
// ---------------------------------------------------------------------

// belépési jogosultság ellenőrzés
app.post('/logincheck', (req, res)=>{
    let table = 'felhasznalok';
    let field1 = 'email';
    let field2 = 'jelszo';
    let value1 = req.body.email;
    let value2 = req.body.passwd;
  
    pool.query(`SELECT * FROM ${table} WHERE ${field1}='${value1}' AND ${field2}='${value2}'`, (err, results)=>{
       if (results.length > 0){
           let user = {
               ID: results[0].ID,
               name: results[0].nev,
               email: results[0].email
            }   
            results[0] ={ token: jwt.sign(user, acces_token, {expiresIn: '1d'})};
        }
        else
        {
            results[0] = { token: '' }
        }
        res.status(200).json(results[0]);
    });
});

// email cím ellenőrzés
app.post('/emailcheck', (req, res)=>{
    let table = 'felhasznalok';
    let field = 'email';
    let value = req.body.email;
 
    pool.query(`SELECT * FROM ${table} WHERE ${field}='${value}'`, (error, results)=>{
        if (error) {
            res.status(500).json(error);
        }else{
            res.status(200).json(results);
        }     
    });
});

// statisztikai adatok lekérése
app.get('/statisztika', tokencheck(), (req, res)=>{
    pool.query('SELECT * FROM statisztika',  (error, results) => {
        if (error) {
            res.status(500).json(error);
        }else{
            res.status(200).json(results);
        }     
      });
});

// javítások lekérése
app.get('/javitasok', tokencheck(), (req, res)=>{
    pool.query('SELECT * FROM javitasok_',  (error, results) => {
        if (error) {
            res.status(500).json(error);
        }else{
            res.status(200).json(results);
        }     
      });
});

// tulajdonosok lekérése
app.get('/tulajdonos', tokencheck(), (req, res)=>{
    pool.query('SELECT * FROM tulajdonos_',  (error, results) => {
        if (error) {
            res.status(500).json(error);
        }else{
            res.status(200).json(results);
        }     
      });
});

// szerelok lekérése
app.get('/szerelok', tokencheck(), (req, res)=>{
    pool.query('SELECT * FROM szerelok_',  (error, results) => {
        if (error) {
            res.status(500).json(error);
        }else{
            res.status(200).json(results);
        }     
      });
});

// tipusok lekérése
app.get('/tipusok', tokencheck(), (req, res)=>{
    pool.query('SELECT * FROM tipusok_',  (error, results) => {
        if (error) {
            res.status(500).json(error);
        }else{
            res.status(200).json(results);
        }     
      });
});

// grafikon adatok lekérése
app.get('/grafikon', tokencheck(), (req, res)=>{
    pool.query('SELECT * FROM grafikon',  (error, results) => {
        if (error) {
            res.status(500).json(error);
        }else{
            res.status(200).json(results);
        }     
      });
});

// felhasználók listájának lekérése
app.get('/felhasznalok', tokencheck(), (req, res)=>{
    pool.query('SELECT * FROM felhasznalok',  (error, results) => {
        if (error) {
            res.status(500).json(error);
        }else{
            res.status(200).json(results);
        }     
      });
});

// új felhasználó hozzáadása
app.post('/felhasznalok', tokencheck(), (req, res)=>{
    let { nev, email, jelszo } = req.body;
    pool.query(`INSERT INTO felhasznalok (ID, nev, email, jelszo) VALUES(null, '${nev}', '${email}', '${jelszo}')`,  (error, results) => {
        if (error) {
            res.status(500).json(error);
        }else{
            res.status(200).json(results);
        }     
      });
});

// felhasználó törlése
app.delete('/felhasznalok/:id', tokencheck(), (req, res)=>{
    let  id = req.params.id;
    pool.query(`DELETE FROM felhasznalok WHERE ID=${id}`,  (error, results) => {
        if (error) {
            res.status(500).json(error);
        }else{
            res.status(200).json(results);
        }     
      });
});

// Server listening
// ---------------------------------------------------------------------

app.listen(port, () => {
    console.clear();
    console.log(`Listening started on port ${port}...`);
});

// Other functions
// ---------------------------------------------------------------------

// Check API token
function tokencheck() {
    return (req, res, next) => {

        const authHeader = req.headers['authorization'];
        const token = authHeader && authHeader.split(' ')[1];
      
        if (token == null) {
            console.log(`Token check error!`);
            return res.status(401).json({ message: 'Illetéktelen hozzáférés!' });
        }
        jwt.verify(token, acces_token, (err, user) => {
            
            if (err) {
                console.log(`Token check error!`);
                return res.status(403).json({ message: 'Illetéktelen hozzáférés!' });
            }
            req.user = user;
            next();
        })
    };
}

// Generate API token
function generateAccessToken(user) {
    return jwt.sign(user, process.env.ACCESS_TOKEN_SECRET, { expiresIn: '1d' })
}

