from flask import Flask
#import abort
from flask import abort
app = Flask(__name__)

@app.route('/user/<id>')
def get_user(id):
	# 404 Not Found
	# abort(404)
	user = load_user(id)
	if not user:
		abort(404)
	return 'Hello, %s' %user.name

if __name__ == '__main__':
	app.run()