class Article < ActiveRecord::Base

	validates :title, presence: true, length: {minimum: 3, maximum: 50}, allow_blank: false
	validates :content, presence: true, length: {minimum:10, maximum: 500}, allow_blank: false
	validates :user_id, presence: true

	belongs_to :user
	has_many :comments, dependent: :destroy

	has_many :likes
end