# save templates in sub folder: templates - index.html, user.html
from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route('/<name>')
def index(name):
	return render_template('value.html', name=name)
	# lower
	# upper
	# title
	# trim
	# striptags

if __name__ == '__main__':
	app.run()