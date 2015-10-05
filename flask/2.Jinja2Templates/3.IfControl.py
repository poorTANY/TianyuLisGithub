from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route('/')
def index():
	return render_template('ifcontrol.html')

@app.route('/<name>')
def index1(name):
	return render_template('ifcontrol.html', name=name)

if __name__ == '__main__':
	app.run()