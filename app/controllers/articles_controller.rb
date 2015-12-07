class ArticlesController < ApplicationController
  layout "navbar"
  def index
    @articles = current_user.articles
  end

  def create
    
  end
end
