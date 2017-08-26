class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum:4, maximum:9}
  validates :description, presence: true,length: {minimum:5, maximum:25}




end