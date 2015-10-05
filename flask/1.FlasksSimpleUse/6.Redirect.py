from flask import Flask
#import redirect
from flask import redirect
app = Flask(__name__)

@app.route('/')
def index():
	# redirect-status code 404
	# redirect another website
	return redirect('http://baidu.com')
	# redirect-status code 302
	# direct to index
	return redirect('index.html')

if __name__ == '__main__':
	app.run()