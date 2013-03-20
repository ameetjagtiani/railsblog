class Post < ActiveRecord::Base
  attr_accessible :title, :content, :created_at, :photo, :category_ids

  validates :title, :content, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => { :message => "already taken" }

  has_attached_file :photo, :styles => { :small => "150x150>" }, :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"
  belongs_to :user
  has_and_belongs_to_many :categories
end
