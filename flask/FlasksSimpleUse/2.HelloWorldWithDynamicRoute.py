from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
	return '<h1>Hello World!</h1>'

@app.route('/<username>')
# parameter: name
def WhateverYouSet(username):
	return '<h1>Hello %s!\
	It is my honor</h1>' %username

@app.route('/username/<name>')
# cannot be the same name
def WhateverYouSet1(name):
	return '<h1>%s, Welcome back!</h1>' %name

if __name__ == '__main__':
	app.run(debug=True)
