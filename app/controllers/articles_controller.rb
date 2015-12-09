class ArticlesController < ApplicationController
  layout "navbar"
  def index
    @articles = current_user.articles
  end
  
  def by_topic_id
    @articles = Topic.find(params[:topic_id]).articles.select("articles.*,article_details.content").joins(:article_detail)
  end

  def create
    
  end
end
