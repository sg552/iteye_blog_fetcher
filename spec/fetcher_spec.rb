# -*- encoding : utf-8 -*-
require File.join File.dirname(__FILE__) , '..', 'fetcher.rb'

describe Fetcher do 
  it '给定HTML，应该可以解析出a, 例如：
  <div class="blog_title">
    <h3><a href="/blog/89390">应用开源项目时，你会大肆封装，修改它吗？</a></h3>
    <div class="news_tag"><a href="http://www.iteye.com/blogs/tag/%E4%BC%81%E4%B8%9A%E5%BA%94%E7%94%A8">企业应用</a><a href="http://www.iteye.com/blogs/tag/%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86">项目管理</a><a href="http://www.iteye.com/blogs/tag/%E5%BA%94%E7%94%A8%E6%9C%8D%E5%8A%A1%E5%99%A8">应用服务器</a><a href="http://www.iteye.com/blogs/tag/Struts">Struts</a><a href="http://www.iteye.com/blogs/tag/Acegi">Acegi</a></div>
  </div>
  应该获得 title 的link:  /blog/89390
  ' do 
    
    Fetcher.extract_post_link(content).should == ['/blog/89390']
  end 
end
