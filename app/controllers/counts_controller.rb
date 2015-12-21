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
	
	def add_topic_article_amount
	end
	
	
	private
	
	def count_params
		params.require(:topic).permit(:browse_times)
	end
end
