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
    (1..MAX_PAGE).each do |index|
      remote_result = Fetcher.get("#{BASE_URL}?page=#{index}")
      puts "== result: #{remote_result}"
    end
  end

  private
  def self.extract_post_link content
      return Nokogiri::HTML(content).css('.blog_title h3 a').map { |a|
	a.attr('href') 
      }
  end 
end
