from flask import Flask, render_template
from flask.ext.bootstrap import Bootstrap

app = Flask(__name__)

bootstrap = Bootstrap(app)

#need to creat document of 404.html and 500.html
@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


@app.errorhandler(500)
def internal_server_error(e):
    return render_template('500.html'), 500

@app.route('/')
def index():
	return render_template('user.html', name="World")

@app.route('/user/<name>')
def index1(name):
	return render_template('user.html', name=name)

if __name__ == '__main__':
	app.run()
