 doc 整个 HTML 文档
 html_attribs <html> 标签的属性
 html <html> 标签中的内容
 head <head> 标签中的内容
 title <title> 标签中的内容
 metas 一组 <meta> 标签
 styles 层叠样式表定义
 body_attribs <body> 标签的属性
 body <body> 标签中的内容
 navbar 用户定义的导航条
 content 用户定义的页面内容
 scripts 文档底部的
 JavaScript 声明

添加新的 JavaScript 文件,需要定义 scripts 块:

{% block scripts %}
{{ super() }}
<script type="text/javascript" src="my-script.js"></script> 
{% endblock %}