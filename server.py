import os,binascii
from flask import Flask, request, session, g, redirect, url_for, abort, \
     render_template, flash
from flaskext.mysql import MySQL
from config import config, ADMINS, MAIL_SERVER, MAIL_PORT, MAIL_USERNAME, MAIL_PASSWORD
import datetime

app = Flask(__name__)

mysql = MySQL()
# create our little application :)
for key in config:
    app.config[key] = config[key]

mysql.init_app(app)
app.config.from_object(__name__)

def get_cursor():
    return mysql.connect().cursor()

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

@app.route("/")
def screen():
    return render_template('index.html')

@app.route("/Student")
def studentTimeTable():
	return render_template('StudentTimeTable.html')

@app.route("/Faculty")
def facultyTimeTable():
	return render_template('FacultyTimeTable.html')

if __name__ == "__main__":
	app.debug = True
	app.secret_key=os.urandom(24)
	app.run()