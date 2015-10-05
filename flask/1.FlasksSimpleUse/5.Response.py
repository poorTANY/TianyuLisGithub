from flask import Flask
from flask import request
from flask import make_response
app = Flask(__name__)

@app.route('/')
def index():
	# make_response allow more than 1 parameter
	response = make_response('This document carries a cookie!')
	response.set_cookie('answers','42')
	return response

if __name__ == '__main__':
	app.run()