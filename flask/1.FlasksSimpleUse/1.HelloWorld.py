#initialize
# __name__ parameter of constructed function
# it decide the root directory of the program
from flask import Flask
app = Flask(__name__)

#define the index() as the program of root directory 
@app.route('/')
#view function
def index():
	# <h1> head title's front 
	return '<h1>Hello World!</h1>'

# directly run this script
if __name__ == '__main__':
	app.run(debug=True)
