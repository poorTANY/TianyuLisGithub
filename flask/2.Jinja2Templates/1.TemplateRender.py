# save templates in sub folder: templates - index.html, user.html
from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route('/')
def index():
	return render_template('index.html')

@app.route('/user/<name>')
def users(name):
	# convert name to template as a parameter
	return render_template('user.html', name=name)

if __name__ == '__main__':
	app.run()