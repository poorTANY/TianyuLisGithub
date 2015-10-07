url_for('static', filename='css/styles.css', _external=True)
# http:// localhost:5000/static/css/styles.css

#默认设置下,Flask 在程序根目录中名为 static 的子目录中寻找静态文件。如果需要,可在 static 文件夹中使用子文件夹存放文件。服务器收到前面那个 URL 后,会生成一个响应, 包含文件系统中 static/css/styles.css 文件的内容。