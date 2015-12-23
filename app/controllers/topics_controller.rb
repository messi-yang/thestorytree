class TopicsController < ApplicationController
  before_action :authenticate_user! ,:except =>[:get_newest,:get_hot]
  layout "navbar"
  
  def get_newest
    @topics = Topic.select("topics.*,users.nickname,articles.content").from("topics,users,articles").where("topics.user_id=users.id AND articles.topic_id=topics.id AND articles.first_article ='t'").order(created_at: :desc).limit(15)
    render json: @topics
  end

  def get_hot
    @topics = Topic.select("topics.*,users.nickname,articles.content").from("topics,users,articles").where("topics.user_id=users.id AND articles.topic_id=topics.id AND articles.first_article ='t'").order(browse_times: :desc).limit(15)
    render json: @topics
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      @info = {status:"success"}
      render json: @info
    else
      @info = {status:"fail"}
      render json: @info
    end
    #redirect_to story_home_static_pages_path
  end

  def topic_params
    params.require(:topic).permit(:title ,:length_limit_min ,:length_limit_max ,:articles_limit ,:private ,:score_limit , :browse_times , :time_out , :comment_amount , :article_amount,
    :articles_attributes => [:user_id,:first_article,:likes,:report_times,:comment_amount,:content] )
  end
end
