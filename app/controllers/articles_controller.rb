class ArticlesController < ApplicationController
  layout "navbar"
  def index
    @articles = current_user.articles.joins
  end
  
  def by_topic_id
    @articles = Article.select("users.nickname,articles.*").from("users,articles").where(["users.id=articles.user_id AND articles.topic_id = ?",params[:topic_id]]).order(:created_at)
    #@articles = Topic.find(params[:topic_id]).articles.joins(:users).on("users.id=articles.user_id")
    @topic = Topic.find(params[:topic_id])
    
    render json: {
             articles: @articles,
             topic: @topic,
           }.to_json
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
