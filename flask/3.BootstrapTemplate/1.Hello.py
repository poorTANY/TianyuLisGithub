from flask import Flask, render_template
from flask.ext.bootstrap import Bootstrap

app = Flask(__name__)

# define bootstrap
bootstrap = Bootstrap(app)

@app.route('/')
def index():
	return render_template('user.html', name="World")

@app.route('/<name>')
def index1(name):
	return render_template('user.html', name=name)

if __name__ == '__main__':
	app.run()


