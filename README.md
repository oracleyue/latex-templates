To be complete

****

说明(论坛介绍留言抄过来的，待整理)：

+ 这个里都是些LaTeX相关的东东，除了latex模板文件*.sty，还有Emacs yasnippet定义的latex 模板，用在AucTeX里提高效率的bash scripts之类的。有点乱了，得花时间之后写个Readme。
+ 现在的话，beamer的模板都在 beamer-sty/下，但是里面的examples里面的tex文件可能有些过期了，因为我调整过好几次我自己写的latex模板文件*.sty文件的名字和options的名字，我之后会更新好的。
+ 如果用Emacs那就简单了，把我的snippets下的beamer命名的文件拷进你的emacs snippets里，然后按我下面的工作流程：
  - 在新文件夹里，运行init-beamer.sh，它会把用到的sty文件拷好（对了，改一下里面的beamer-sty这个文件夹所在的路径）；
  - 建一个.tex文件，Emacs里调用yasnippet关键字beamer, 它会列出我所有常用的模板，选一个就会自动生成代码，然后你填内容就成了。
- 另外，beamer-sty下面有个叫beamer-templates.zip的文件，那里面应该是都能编译的，之前给学生的，可能和最新的风格有点出入，但基本一样。

更多怎么用，我这几天写到readme里吧。抱歉，之前一直自己用，所以没在意这些。
