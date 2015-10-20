from flask import Flask, render_template, session, redirect, url_for, flash
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

# essential
moment = Moment(app)

class NameForm(Form):
	name = StringField('What is your name?', validators=[Required()])
	submit = SubmitField('Submit')
	
@app.route('/', methods=['GET', 'POST'])
def index():
	form = NameForm()
	if form.validate_on_submit():
		old_name = session.get('name')
		if old_name is not None and old_name != form.name.data:
			flash('You have changed your name!')
		session['name'] = form.name.data
		# method name index()
		return redirect(url_for('index'))
	return render_template('flashindex.html', form=form, name=session.get('name'))

if __name__ == '__main__':
	app.run()