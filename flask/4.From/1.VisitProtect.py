from flask import Flask

app=Flask(__name__)

# set the secret key
app.config['SECRET_KEY'] = 'a String'

@app.route('/')
def index()
	return 'Hello World!'

if __name__ = '__main__':
	app.run()