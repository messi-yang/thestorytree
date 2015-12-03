class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.integer :topic_id
      t.boolean :first_article
      t.integer :likes
      t.integer :report_times

      t.timestamps null: false
    end
  end
end
