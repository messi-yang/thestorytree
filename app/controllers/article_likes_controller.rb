class ArticleLikesController < ApplicationController
	
	def create
		@article_record = ArticleLike.new(count_params)
		
		if @article_record.save
			render json: {article_likes_id: @article_record.id}
		else
			render json: {status: "fail"}
		end
	end
	
	def destroy
		article_record = ArticleLike.find(params[:id])
		article_record.destroy
		render json: {status: "success"}
	end
	
	private
	
	def count_params
		params.require(:article_like).permit(:article_id, :user_id, :topic_id)
	end
end
