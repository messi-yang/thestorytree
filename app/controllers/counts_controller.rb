class CountsController < ApplicationController
	
	def add_topic_browse_times
		topic_browse = Topic.find(params[:topic_id])
		topic_browse.browse_times += 1
		
		if topic_browse.save
			 render json: {status:"success"}
    else
      render json: {status:"fail"}
    end		
	end
	
	def add_topic_article_amounts
		topic_article_amounts = Topic.find(params[:topic_id])
		topic_article_amounts.article_amount += 1
		
		if topic_article_amounts.save
			render json: {status: "success"}
		else
			render json: {status: "fail"}
		end
	end

	def add_article_likes
		if params.size == 6
			@article_likes = Article.find(params[:article_id])
			@article_likes.likes += 1
		else
			@article_likes = Article.find(params[:article_id])
			@article_likes.likes -= 1
		end
		
		if @article_likes.save
			render json: {article_likes: @article_likes.likes}
		else
			render json: {status: "fail"}
		end
	end

	def add_article_comment_amount
	  @article_comment_amount = Article.find(params[:article_id])
	  @article_comment_amount.comment_amount +=1

	  if @article_comment_amount.save
	    render json: {
	    	     status: "success",
	    	     comment_amount:@article_comment_amount.comment_amount
	    	   }
	  else
	    render json: {status: "fail"}
	  end
	end
	
	private
	
	def count_params
		params.require(:topic).permit(:topic_id, :user_id, :article_id)
	end
end
