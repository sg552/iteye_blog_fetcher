# -*- encoding : utf-8 -*-
require 'nokogiri'
require 'httparty'

class Fetcher
  include HTTParty
  BASE_URL = 'http://sg552.iteye.com'
  MAX_PAGE = 1
  headers 'User-Agent' => 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36',
    'Referer' => BASE_URL,
    'Host' => 'sg552.iteye.com',
    'Accept-Language' => 'zh-CN,zh;q=0.8,en;q=0.6,zh-TW;q=0.4'
  
  def self.fetch 
    your_post_urls = []
    (1..MAX_PAGE).each do |index|
      remote_result = Fetcher.get("#{BASE_URL}?page=#{index}").body
      your_post_urls += self.extract_post_link remote_result
    end
    your_post_urls.each  do |url|
      information = self.extract_post_information_from_single_page url
      insert_as_local_posts(information)
    end
  end

  private
  def self.insert_as_local_posts information
     # FIXME insert to our local database
     # Blog.create :content => information[:content], :title => information[:title], 
     #   :created_at => information[:created_at]
  end
  def self.extract_post_link content
    return Nokogiri::HTML(content).css('.blog_title h3 a').map { |a|
      a.attr('href') 
    }
  end 
  def self.extract_post_information_from_single_page url
    remote_result = Fetcher.get(url).body
    result = {}
    return {
      :content => Nokogiri::HTML(remote_result).css('#blog_content').to_html, 
      :title => Nokogiri::HTML(remote_result).css('.blog_title h3 a').text,
      :created_at => Nokogiri::HTML(remote_result).css('.blog_bottom li')[0].text + ':00'
    }
  end
  
end

