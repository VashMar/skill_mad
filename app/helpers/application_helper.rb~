module ApplicationHelper
# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "SkillMad"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end


def current_video=(video)
    @current_video = video 
end

def current_video
    @current_video ||= Video.order("points DESC").first(:include => :user)
end

def paginate(collection, params= {})
    will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
  end

def num_rank(num)
   if(num == 1)
     @rank = "1st"
   elsif(num == 2)
     @rank = "2nd"
   elsif(num == 3)
     @rank = "3rd"  
   else
     @rank = "#{num}th"
   end  
end


def meta_array(path)

if path == "/home"
 @link_img = "http://www.skillmad.com/skillmad_graph.gif"
 @description = "A Video Platform for Madison Campus for Video Sharing and Promotion!"
 @title = "Skillmad"
else
 @link_img = "http://img.youtube.com/vi/#{path[9..19]}/0.jpg" 
 @video = Video.find_by_yt_video_id(path[9..19])
 @description = ""
 @title = ""
 if @video != nil 
   @description = @video.description
   @title = @video.title
 end 
end


@meta_array = [@link_img, @description, @title]
end

end
