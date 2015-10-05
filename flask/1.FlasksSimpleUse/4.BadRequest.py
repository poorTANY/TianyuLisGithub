from flask import Flask
from flask import request
app = Flask(__name__)

@app.route('/')
def index():
	# 200 success 400 failure
	return '<h1>Bad Request</h1>', 400

if __name__ == '__main__':
	app.run()