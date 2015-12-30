class AddTopicIdToArticleLikes < ActiveRecord::Migration
  def change
  	add_column :article_likes, :topic_id, :integer
  end
end
