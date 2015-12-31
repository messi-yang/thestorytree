class ArticleCommentsController < ApplicationController

  def by_article_id
  	＠article_comments=ArticleComment.select("article_comments.*,users.nickname").from("article_comments,users").where(["article_comments.article_id=? AND article_comments.user_id=users.id",params[:article_id]])
  	render json: ＠article_comments
  end	

  def create
  	＠article_comment=Article.find(params[:article_id]).article_comments.build(article_comment_params)
    if ＠article_comment.save
      render json: {status:"success"}
    else
      render json: {status:"fail"}
    end
  end

  def article_comment_params
  	params.require(:article_comments).permit(:content,:user_id)
  end

end
