# Ruby on Rails での Nokogiri を使用したウェブスクレイピング

このプロジェクトでは、Nokogiri を使用して特定のウェブページから情報を抽出する方法を示しています。以下に、実装のステップを説明します。

## 必要なもの

- Ruby on Rails
- Nokogiri gem

## セットアップ

1. Nokogiri を Gemfile に追加してインストールします。

   ```ruby
   gem 'nokogiri'
   ```

   次に、バンドルを実行します。

   ```bash
   bundle install
   ```

## 使用方法

この例では、`https://ja.wikipedia.org/wiki/Ruby` から Ruby のウィキペディアページのタイトルと最初の段落を抽出し、Ruby のロゴ画像の URL を取得します。

1. コントローラーにスクレイピングロジックを追加します（例: `app/controllers/your_controller.rb`）。

   ```ruby
   require 'nokogiri'
   require 'open-uri'

   class YourController < ApplicationController
     def index
       url = 'https://ja.wikipedia.org/wiki/Ruby'
       html = URI.open(url)
       doc = Nokogiri::HTML(html)

       @title = doc.css('h1').text
       @intro = doc.css('p').first.text

       img_src = doc.css('img').first.attr('src')
       @img_url = img_src.start_with?('//') ? "https:#{img_src}" : img_src
     end
   end
   ```

2. ビューを作成して結果を表示します（例: `app/views/your_controller/index.html.erb`）。

   ```erb
   <h1><%= @title %></h1>
   <p><%= @intro %></p>
   <%= image_tag @img_url, alt: "Ruby Logo" %>
   ```

これで、指定されたウェブページから情報を抽出し、Rails アプリケーションで表示する基本的なスクレイピング機能が実装されました。
