class Video < ActiveRecord::Base
 
  belongs_to :user
  belongs_to :category
  belongs_to :leaderboard 
  has_many :votes
  scope :completes,   where(:is_complete => true)
  scope :incompletes, where(:is_complete => false)
  attr_accessible :title, :description, :yt_video_id, :is_complete , :points, :user_id, :is_private, :category_id, :leaderboard_id, :flag_count 


 
 include PgSearch
 pg_search_scope :search, against: [:title, :description],
  using: {tsearch: {dictionary: "english"}},
   associated_against: {user: :name, leaderboard: :leaderboard_name, category: :category_name}

 def self.text_search(query)
  if query.present?
   search(query)
  else
   scoped
  end
 end 
  
  def self.yt_session
    @yt_session ||= YouTubeIt::Client.new(:username => YouTubeITConfig.username , :password => YouTubeITConfig.password , :dev_key => YouTubeITConfig.dev_key)    
  end

  def self.delete_video(video)
    yt_session.video_delete(video.yt_video_id)
    video.destroy
      rescue
        video.destroy
  end

  def self.update_video(video, params)
    yt_session.video_update(video.yt_video_id, video_options(params))
    video.update_attributes(params)
  end

  def self.token_form(params, nexturl)
    yt_session.upload_token(video_options(params), nexturl)
  end

  def self.delete_incomplete_videos
    self.incompletes.map{|r| r.destroy}
  end

  def self.find_in_cat(category_id)
     where("category_id = ?" , category_id)
  end

  def self.find_in_lb(leaderboard_id)
     where("leaderboard_id =?", leaderboard_id)	
  end 

  private
    def self.video_options(params)
      opts = {:title => params[:title],
             :description => params[:description],
             :category => "People",
             :keywords => ["skill"],
             :is_private => params[:is_private]}
      params[:is_private] == "true" ? opts.merge(:list => "denied") : opts
    end
end
