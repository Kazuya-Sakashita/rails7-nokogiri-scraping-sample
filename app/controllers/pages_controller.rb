class PagesController < ApplicationController

  require 'open-uri'
  require 'nokogiri'

  def index
    url = 'https://ja.wikipedia.org/wiki/Ruby'
    html = URI.open(url)
    doc = Nokogiri::HTML(html)

    @title = doc.css('h1').text
    @intro = doc.css('p').first.text


    html_content = '<a href="/wiki/%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB:Ruby_logo.svg" class="mw-file-description"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/70px-Ruby_logo.svg.png" decoding="async" width="70" height="70" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/105px-Ruby_logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/140px-Ruby_logo.svg.png 2x" data-file-width="198" data-file-height="198"></a>'

    # Nokogiriを使用してHTMLをパース
    doc = Nokogiri::HTML(html_content)

    # `img` タグの `src` 属性を取得
    img_src = doc.css('img').attr('src').value

    # 完全なURLを生成するためにプロトコルを追加（必要な場合）
    @img_url = img_src.start_with?('//') ? "https:#{img_src}" : img_src
  end
end
