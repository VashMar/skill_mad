 class User < ActiveRecord::Base

  has_many :videos
  has_many :votes
  has_many :categories, :through => :videos
  has_many :leaderboards, :through => :videos 
  attr_accessible :email, :name, :password, :password_confirmation, :activated, :avatar, :points, :major, 
  :skill, :about, :year , :activated 
                 
  has_attached_file :avatar, :styles => {:large => "185x185#", :medium => "110x110#",  :thumb => "60x60#"}, 
  :storage => :s3,
  :s3_credentials => S3_CREDENTIALS,
  :path => ":id/:style/:basename.:extension",
  :url => ":id/:style/:basename.:extension",
  :default_url => "https://s3.amazonaws.com/skillmadavatars/:style/bucky.png"

  has_secure_password
  before_save { |user| user.email = email.downcase}
  before_save :create_remember_token

  validates_attachment :avatar, :size => {:in => 0..250.kilobytes}
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

 

 def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
 end


  
end
