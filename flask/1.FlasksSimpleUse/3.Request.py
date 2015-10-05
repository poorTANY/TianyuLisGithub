from flask import Flask
#import request from flask
from flask import request
app = Flask(__name__)

@app.route('/')
def index():
	# request context
	user_agent = request.headers.get('User-Agent')
	return '<p>Your browser is %s, Hey!</p>' %user_agent

if __name__ == '__main__':
	app.run()