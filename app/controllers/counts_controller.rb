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

	
	private
	
	def count_params
		params.require(:topic).permit(:topic_id)
	end
end
