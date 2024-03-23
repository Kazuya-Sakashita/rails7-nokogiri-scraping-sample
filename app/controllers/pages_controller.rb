class PagesController < ApplicationController

  require 'open-uri'
  require 'nokogiri'

  def index
    url = 'https://ja.wikipedia.org/wiki/Ruby'
    html = URI.open(url)
    doc = Nokogiri::HTML(html)

    @title = doc.css('h1').text
    @intro = doc.css('p').first.text
  end
end
