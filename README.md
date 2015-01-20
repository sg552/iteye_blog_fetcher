# Blog Fetcher

用来抓取iteye网站的 博客的脚本.

自从12年有了自己的主机之后，就一直想把在javaeye (iteye) 上的博客同步过来。可惜一直没能做成。今天就做一下吧。

# 原理

只适用于抓取  base_url?page=1  ,  base_url?page=2 这样类型的博客。

人肉写好 要抓取的页面的URL， 以及总共有多少个页面，就可以抓取了。

# 安装

$ git clone ...

$ cd <project_path>

$ bundle install

修改 `fetcher.rb`  ， 文件，把需要抓取的地址和页数写好。

修改 config/database.yml 文件，按照你的数据库配置来。

# 运行

$ ruby run.rb

# 测试：

$ bundle exec rspec spec

# 我的个人博客

http://siwei.me  有问题欢迎联系我
