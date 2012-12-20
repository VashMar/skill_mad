 class User < ActiveRecord::Base

  has_many :videos
  has_many :votes
  attr_accessible :email, :name, :password, :password_confirmation, :activated, :avatar, :points, :major, 
  :skill, :about, :year , :activated                  
  has_attached_file :avatar, :styles => {:large => "185x185>", :medium => "110x110>",  :thumb => "70x70>"}, :default_url => "avatars/:style/bucky.png",
  :url => "avatars/:id/:style/:basename.:extension",
  :path => ":rails_root/app/assets/images/avatars/:id/:style/:basename.:extension"
  has_secure_password
  before_save { |user| user.email = email.downcase}
  before_save :create_remember_token

  validates_attachment :avatar, :size => {:in => 0..100.kilobytes}
  validates_attachment_content_type :avatar, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'
  validates :name, :presence => true, :length => {:maximum => 50}, :uniqueness => {:case_sensitive => false}
  validates :password_confirmation, :presence => true, :on => :create 
  validates :password, :presence => true, :length => {:minimum => 6}, :on => :create 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@wisc.edu/i
  validates :email, :presence => true, :format => {:with => VALID_EMAIL_REGEX}, :uniqueness => {:case_sensitive => false}
  validates :about, :length =>{:maximum => 200}
  def activated?
    self.activated
  end
 
 def selectable_users
    self.where(:hasVideo => true)
 end
 
 private
  
  def create_remember_token
    self.remember_token = SecureRandom.hex
  end
  
end
