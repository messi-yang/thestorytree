class Topic < ActiveRecord::Base

  has_many :articles
  belongs_to :user
  accepts_nested_attributes_for :articles
end
