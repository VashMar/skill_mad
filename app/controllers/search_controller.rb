class SearchController < ApplicationController


def show  

if params[:page] == nil  
params[:page] = 1 
end 

@results = Video.text_search(params[:query]).where("yt_video_id is not null").page(params[:page]).per_page(10)
@query = params[:query]
 respond_to do |format|
  format.html{render 'search/results'}
  format.js{} 
 end
 
end 








end
