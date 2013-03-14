class Post < ActiveRecord::Base
  attr_accessible :title, :content, :created_at, :photo

  validates :title, :content, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => { :message => "already taken" }

  has_attached_file :photo, :styles => { :small => "150x150>" }, :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"
end
