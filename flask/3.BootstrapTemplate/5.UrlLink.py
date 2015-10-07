@app.add_url_route()
# 函数最简单的用法是以视图函数名(或者 app.add_url_route() 定义路由时使用 的端点名)作为参数,返回对应的 URL。

url_for('index')
# return /

url_for('index', _external=True)
# return address http://localhost:5000/

url_for ('user', name='john', _external=True)
# http://localhost:5000/user/john

url_for('index', page=2)
# /?page=2