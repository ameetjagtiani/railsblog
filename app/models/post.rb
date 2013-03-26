class Post < ActiveRecord::Base
  #START = 1
  #READY = 2
  #APPROVED = 3

  #STATUSES = {
 # 	START => 'start',
 # 	READY => 'ready',
 # 	APPROVED => 'approved'
 # }

  #validates_inclusion_of :status, :in => STATUSES.keys,
   #   :message => "{{value}} must be in #{STATUSES.values.join ','}"
  # validates_inclusion_of :status, :in => [:approved,:start,:ready]

  attr_accessible :title, :content, :created_at, :photo, :category_ids, :status_id

  validates :title, :content, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => { :message => "already taken" }

  has_attached_file :photo, :styles => { :small => "150x150>" }, :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"
  belongs_to :user
  has_and_belongs_to_many :categories

  #each post has a status
  belongs_to :status

  def status_name
    STATUSES[status]
  end

  def status
     read_attribute(:status).to_s
   end

  def status= (value)
     write_attribute(:status, value.to_s)
   end
end
