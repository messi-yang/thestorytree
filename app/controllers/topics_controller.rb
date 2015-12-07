class TopicsController < ApplicationController
  before_action :authenticate_user!
  layout "navbar"

  def new
    @topic = current_user.topics.build
    @article =  @topic.articles.build
    @article.build_article_detail
  end

  def create
    @topic = current_user.topics.build(topic_params)
    @topic.save
  end

  def topic_params
    params.require(:topic).permit(:title ,:length_limit_min ,:length_limit_max ,:articles_limit ,:private ,:score_limit ,
    :articles_attributes => [:user_id,:first_article,:likes,:report_times,:comment_amount,:article_detail_attributes =>[:content] ] )
  end
end
