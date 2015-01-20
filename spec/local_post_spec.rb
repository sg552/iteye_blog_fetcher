# -*- encoding : utf-8 -*-
require File.join File.dirname(__FILE__) , '..', 'local_post.rb'

describe LocalPost do 
  it 'should connect to db' do 
    LocalPost.count.should >= 0 
  end 
end
