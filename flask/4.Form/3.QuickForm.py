from flask import Flask, render_template, session, redirect, url_for
from flask.ext.script import Manager
from flask.ext.bootstrap import Bootstrap
from flask.ext.moment import Moment
from flask.ext.wtf import Form
from wtforms import StringField, SubmitField
from wtforms.validators import Required

app = Flask(__name__)

# it must have a secret key
app.config['SECRET_KEY'] = 'hard to guess string'

bootstrap = Bootstrap(app)

# manager = Manager(app)

# and it must have moment
moment = Moment(app)

class NameForm(Form):
	name = StringField('What is your name?', validators=[Required()])
	submit = SubmitField('Submit')

@app.route('/',methods=['GET','POST'])
def index():
	name = None
	form = NameForm()
	if form.validate_on_submit():
		name = form.name.data
		form.name.date = ''
	return render_template('index.html',form=form,name=name)

if __name__ == '__main__':
	app.run()