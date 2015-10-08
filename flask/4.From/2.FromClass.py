# Form 基类由 Flask-WTF 扩展定义,所以从 flask.ext.wtf 中导入。字段和验 证函数却可以直接从 WTForms 包中导入。
from flask import Flask
from flask.ext.wtf import Form
from wtforms import StringField, SubmitField
from wtforms.validators import Required

class NameFrom(From):
	name = StringField('What is your name?', validators=[Required()])
	submit = SubmitField('submit')
# StringField 类表示属性为 type="text" 的 <input> 元素。
# SubmitField 类表示属性为 type="submit" 的 <input> 元素。
# 字段构造函数的第一个参数是把表单渲染成 HTML 时使用的标号。

# HTML标准字段
# StringField 
# TextAreaField 
# PasswordField
# HiddenField 
# DateField
# DateTimeField 
# IntegerField
# DecimalField
# FloatField
# BooleanField 
# RadioField 
# SelectField 
# SelectMultipleField 
# FileField 
# SubmitField
# FormField
# FieldList