from flask import Flask, request, jsonify, render_template
from flask_mysqldb import MySQL
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = password
app.config['MYSQL_DB'] = 'library_managment'

mysql = MySQL(app)

@app.route('/')
def index():
    return render_template('index.html')  # serve HTML via Flask

### -------------------- BOOKS --------------------
@app.route('/books', methods=['GET'])
def get_books():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM books")
    result = cur.fetchall()
    cur.close()
    return jsonify(result)

@app.route('/books', methods=['POST'])
def add_book():
    data = request.json
    cur = mysql.connection.cursor()
    query = """INSERT INTO books (isbn, book_title, category, rental_price, fine_price, status, author, publisher)
               VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""
    cur.execute(query, (data['isbn'], data['book_title'], data['category'], data['rental_price'],
                        data['fine_price'], data['status'], data['author'], data['publisher']))
    mysql.connection.commit()
    cur.close()
    return jsonify({"message": "Book added!"})

### -------------------- MEMBERS --------------------
@app.route('/members', methods=['GET'])
def get_members():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM members")
    result = cur.fetchall()
    cur.close()
    return jsonify(result)

@app.route('/members', methods=['POST'])
def add_member():
    data = request.json
    cur = mysql.connection.cursor()
    query = "INSERT INTO members (member_id, member_name, member_address, reg_date) VALUES (%s, %s, %s, %s)"
    cur.execute(query, (data['member_id'], data['member_name'], data['member_address'], data['reg_date']))
    mysql.connection.commit()
    cur.close()
    return jsonify({"message": "Member added!"})

### -------------------- ISSUED STATUS --------------------
@app.route('/issued', methods=['GET'])
def get_issued():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM issued_status")
    result = cur.fetchall()
    cur.close()
    return jsonify(result)

@app.route('/issued', methods=['POST'])
def add_issued():
    data = request.json
    cur = mysql.connection.cursor()
    query = """INSERT INTO issued_status (issued_id, issued_member_id, issued_book_name, issued_date, expected_return_date, issued_book_isbn)
               VALUES (%s, %s, %s, %s, %s, %s)"""
    cur.execute(query, (data['issued_id'], data['issued_member_id'], data['issued_book_name'],
                        data['issued_date'], data['expected_return_date'], data['issued_book_isbn']))
    mysql.connection.commit()
    cur.close()
    return jsonify({"message": "Book issued!"})

### -------------------- RETURN STATUS --------------------
@app.route('/returns', methods=['GET'])
def get_returns():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM return_status")
    result = cur.fetchall()
    cur.close()
    return jsonify(result)

@app.route('/returns', methods=['POST'])
def add_return():
    data = request.json
    cur = mysql.connection.cursor()
    query = """INSERT INTO return_status (return_id, issued_id, return_book_isbn, actual_return_date)
               VALUES (%s, %s, %s, %s)"""
    cur.execute(query, (data['return_id'], data['issued_id'], data['return_book_isbn'], data['actual_return_date']))
    mysql.connection.commit()
    cur.close()
    return jsonify({"message": "Book returned!"})

### -------------------- CHARGES --------------------
@app.route('/charges', methods=['GET'])
def get_charges():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM charges")
    result = cur.fetchall()
    cur.close()
    return jsonify(result)

@app.route('/charges', methods=['POST'])
def add_charge():
    data = request.json
    cur = mysql.connection.cursor()
    query = """INSERT INTO charges (c_id, total_amount, return_id, isbn)
               VALUES (%s, %s, %s, %s)"""
    cur.execute(query, (data['c_id'], data['total_amount'], data['return_id'], data['isbn']))
    mysql.connection.commit()
    cur.close()
    return jsonify({"message": "Charge added!"})

### -------------------- Run Flask App --------------------
if __name__ == '__main__':
    app.run(debug=True)
