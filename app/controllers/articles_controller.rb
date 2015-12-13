class ArticlesController < ApplicationController
  layout "navbar"
  def index
    @articles = current_user.articles
  end
  
  def by_topic_id
    @articles = Topic.find(params[:topic_id]).articles
    render json: @articles
  end

  def create
    @article = Topic.find(params[:topic_id]).articles.build(article_params)
    if @article.save
      render json: {status:"success"}
    else
      render json: {status:"fail"}
    end
  end

  def article_params
    params.require(:article).permit(:topic_id ,:user_id , :likes , :first_article , :comment_amount , :report_times ,
    :content)
  end
end
