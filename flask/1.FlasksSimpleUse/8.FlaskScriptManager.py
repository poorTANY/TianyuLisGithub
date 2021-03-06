from flask import Flask
# all extension are in .ext.script
from flask.ext.script import Manager
app = Flask(__name__)

# manager the app
manager = Manager(app)

@app.route('/')
def index():
    return '<h1>Hello World!</h1>'


@app.route('/user/<name>')
def user(name):
    return '<h1>Hello, %s!</h1>' % name


if __name__ == '__main__':
    manager.run()
