class User < ActiveRecord::Base

  has_many :videos
  has_many :votes
  has_many :categories, :through => :videos
  has_many :leaderboards, :through => :videos 
  attr_accessible :email, :name, :password, :password_confirmation, :activated, :avatar, :points, :major, 
  :skill, :about, :year , :admin 
                 
  has_attached_file :avatar, :styles => {:large => "185x185#", :medium => "110x110#",  :thumb => "60x60#"}, 
  :storage => :s3,
  :s3_credentials => S3_CREDENTIALS,
  :path => ":id/:style/:basename.:extension",
  :url => ":id/:style/:basename.:extension",
  :default_url => "https://s3.amazonaws.com/skillmadavatars/:style/bucky.png"

  has_secure_password
  before_save { |user| user.email = email.downcase}
  before_save :create_remember_token




 
  validates_attachment_content_type :avatar, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'
  validates :name, :presence => true, :length => {:maximum => 50}, :uniqueness => {:case_sensitive => false}
  validates :password_confirmation, :presence => true, :on => :create 
  validates :password, :presence => true, :length => {:minimum => 6}, :on => :create 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@wisc.edu/i
  validates :email, :presence => true, :format => {:with => VALID_EMAIL_REGEX}, :uniqueness => {:case_sensitive => false}, :on => :create 
  validates :about, :length =>{:maximum => 200}
 

  def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      if user.id  
       user 
      else 
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.email.slice(0..(auth.info.email.index('@') - 1)) 
      user.email = auth.info.email
      pass = SecureRandom.hex 
      user.password = pass
      user.password_confirmation = pass  
      user.activated = true 
      if user.valid? 
        user.save!
      else
        return false
      end 
 
      end 
   end
  end
 
  def activated?
    self.activated
  end
 
  def selectable_users
    self.where(:hasVideo => true)
  end

  def generate_token(column)
    begin
    self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


  def send_password_reset
   generate_token(:password_reset_token)
   self.password_reset_sent_at = Time.zone.now
   save!
   UserMailer.password_reset(self).deliver
  end 

 private
  
  def create_remember_token
    self.remember_token = SecureRandom.hex
  end


end
