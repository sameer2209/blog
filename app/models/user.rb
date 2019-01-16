class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" } 
  #:keep_old_files => true

  validates_attachment :image,
                         size: { in: 0..9000.kilobytes },
                         content_type: { content_type: ["image/jpeg", "image/png", "image/gif"] }

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  # after_rollback :print_error

  # def print_error
  # 	puts "coming here----------------"
  # 	puts .errors.inspect
  # end
end
