class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :user_id
      t.integer :length_limit_min
      t.integer :length_limit_max
      t.integer :articles_limit
      t.boolean :private
      t.integer :score_limit
      t.integer :likes
      t.integer :report_times
      t.integer :comment_amount
      t.integer :browse_times
      t.integer :time_out

      t.timestamps null: false
    end
  end
end
