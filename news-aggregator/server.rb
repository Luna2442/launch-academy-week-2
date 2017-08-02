require "sinatra"
require "csv"
require "pry"

set :bind, '0.0.0.0'

get "/"do
  erb :home
end

get "/articles/new" do
  erb :new_article
end

get "/articles" do
  @articles = []

  CSV.foreach("articles.csv", headers: true, header_converters: :symbol) do |row|
    @articles << row
  end

  erb :articles
end

post "/articles" do
  @article_name = params[:article_name]
  @article_description = params[:article_description]
  @article_url = params[:article_url]

  if @article_name == ""
    @name_error = true
    erb :new_article
  elsif @article_description == ""
    @description_error = true
    erb :new_article
  elsif @article_url == ""
    @url_error = true
    erb :new_article
  else
    CSV.open("articles.csv", "ab") do |csv|
      csv << [@article_name, @article_description, @article_url]
    end
    redirect '/articles'
  end

end

get "articles/:article" do
  @article.name = params[:article]

  erb :article
end
