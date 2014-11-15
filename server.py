import os,binascii
from flask import Flask, request, session, g, redirect, url_for, abort, \
     render_template, flash, jsonify
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

@app.route("/Allot")
def allot():
	courses=["ToC","DWDM","OS","SE","EEA"]
	days=["Mon","Tue","Wed","Thu","Fri"]
	db=get_cursor()
	sql="select * from timetable where classid=%s"%(101)
	db.execute(sql)
	table=db.fetchall()
	block=[]
	for item in table:
		k=[str(item[1]),str(item[-2]),str(item[-1])]
		block.append(k)
	db.execute("COMMIT")
	return render_template('allotment.html',courses=courses,days=days,block=block)

@app.route("/test",methods=['POST'])
def test():
	mesg=""
	day=""
	db=get_cursor()
	if request.method=="POST":
		subj=str(request.form['course'])
		day=str(request.form['day'])
		time=str(request.form['time'])
		mesg=subj
		userid=1
		sql="insert into timetable values(%s,'%s','%s','%s','%s')"%(101,subj,userid,day,time)
		db.execute(sql)
		db.execute("COMMIT")
		sql="select name from courses where courseid=%s"%(subj)
		db.execute(sql)
		subject=db.fetchone()[0]
		# print subject
		db.execute("COMMIT")
	return jsonify({'subj':mesg,'day':day,'subject':subject})

if __name__ == "__main__":
	app.debug = True
	app.secret_key=os.urandom(24)
	app.run()