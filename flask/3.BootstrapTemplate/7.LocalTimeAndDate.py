from datetime import datetime
from flask import Flask, render_template
from flask.ext.bootstrap import Bootstrap

# initialize flask-moment
from flask.ext.moment import Moment

app = Flask(__name__)

bootstrap = Bootstrap(app)
moment = Moment(app)
# always need bootstrap
# using moment.js

# datetime value
@app.route('/')
def index():
	return render_template('indexwithtime.html', current_time=datetime.utcnow())

if __name__ == '__main__':
	app.run()
