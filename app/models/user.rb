class User < ActiveRecord::Base
  has_many :articles
  before_save { self.email = email.downcase}
  validates :title, presence: true,length: {minimum:4, maximum:9}, uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {minimum:5, maximum:30}, uniqueness: {case_sensitive: false}



end  