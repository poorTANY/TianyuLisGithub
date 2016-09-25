from flask.ext.sqlalchemy import SQLalchemy

basedir = os.path.abspath(os.path.dirname(__file__))

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URL'] =\
    'sqlite:///' + os.path.join(basedir, 'data.sqlite')
app.config['SQLACHEMY_COMMIT_ON_TEARDOWN'] = True

db = SQLalchemy(app)