class ArticlesController < ApplicationController
  layout "navbar"
  def index
    @articles = current_user.articles.joins
  end
  
  def by_topic_id
    @articles = Article.select("users.email,articles.*").from("users,articles").where(["users.id=articles.user_id AND articles.topic_id = ?",params[:topic_id]])
    #@articles = Topic.find(params[:topic_id]).articles.joins(:users).on("users.id=articles.user_id")
    @topic = Topic.find(params[:topic_id])
    @article_has_liked = ArticleLike.select("article_likes.article_id").where(["article_likes.topic_id=topic_id AND article_likes.user_id=user_id", params[:topic_id]])
    render json: {
             articles: @articles,
             topic: @topic,
             article_has_liked: @article_has_liked#.map{|x| x[:article_id]}
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
