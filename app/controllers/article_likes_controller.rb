class ArticleLikesController < ApplicationController
	
	def get_article_likes
    @article_has_liked = ArticleLike.select("article_id").where("topic_id = ? AND user_id = ?",params[:topic_id],params[:user_id])
		
		render json: {
								article_has_liked: @article_has_liked.map{|x| x[:article_id]}
             		#article_has_liked: Hash[(@article_has_liked.map{|x| x[:article_id]}).map{|id| [id, true]}]
           }.to_json
	end
	
	def delete_article_like_id
		@article_like_id = ArticleLike.find_by("topic_id = ? AND user_id = ? AND article_id = ?", params[:topic_id], params[:user_id],params[:article_id])
		@article_like_id.destroy
		render json: {status: "success"}
	end
	
	def create
		@article_record = ArticleLike.create(count_params)
		
		if @article_record.save
			render json: {article_likes_id: @article_record.id}
		else
			render json: {status: "fail"}
		end
	end
	
	
	private
	
	def count_params
		params.require(:article_like).permit(:article_id, :user_id, :topic_id)
	end
end
