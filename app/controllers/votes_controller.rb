class  VotesController < ApplicationController 

def add_vote 
  @video = Video.find(params[:video]) # get current video
  @voter = User.find(params[:voter])  # get current voter
  @owner = User.find(params[:owner])  # get current video's owner
  @vote = Votes.find_vote(@voter.id, @video.id)[0] # check if the user has voted on the video before

  if    @vote == nil # if not add voter/video to vote table 
	@vote = Votes.new
	@vote.user_id = @voter.id
	@vote.video_id = @video.id
	@vote.voted_up = true
	@vote.save
	@owner.update_column(:points, @owner.points + 1) #increment video creator points
  	@video.increment!(:points) #increment video's points


  elsif @vote.voted_up #video was previously voted up_user_points 
        @vote.delete
        if(@video.points > 0)
	   @owner.update_column(:points, @owner.points - 1) #decrement by 1 to account for 1 of previous vote_up
  	   @video.update_column(:points, @video.points - 1)
       end
  
  else  #video was previously voted down
	@vote.voted_down = false # remove vote_down flag
	@vote.voted_up = true # set vote_up flag
	@vote.save
        if(@video.points != 0)
	   @owner.update_column(:points, @owner.points + 2) #increment by 2 to account for -1 of previous vote_down
  	   @video.update_column(:points, @video.points + 2)
        else 
           @owner.update_column(:points, @owner.points + 1) #increment by 2 to account for -1 of previous vote_down
  	   @video.update_column(:points, @video.points + 1)
        end
  end



 render :nothing => true

end 


def remove_vote 
  @video = Video.find(params[:video])
  @voter = User.find(params[:voter]) 
  @owner = User.find(params[:owner])
  @vote = Votes.find_vote(@voter.id, @video.id)[0] # check if the user has voted on the video before
  
   if  @vote == nil # if not add voter/video to vote table 
	@vote = Votes.new
	@vote.user_id = @voter.id
	@vote.video_id = @video.id
	@vote.voted_down = true
	@vote.save
        if(@video.points != 0)
	@owner.update_column(:points, @owner.points - 1)
  	@video.decrement!(:points)
	end


  elsif @vote.voted_down #video was previously voted down_user_points 
        @vote.delete
	@owner.update_column(:points, @owner.points + 1) #increment by 1 to account for 1 of previous vote_up
  	@video.update_column(:points, @video.points + 1)
  

  else 
	@vote.voted_up = false # remove vote_up flag
	@vote.voted_down = true # set vote_down flag
	@vote.save 
        if(@video.points != 0) #don't decrement below 0
            if(@video.points != 1)
	      @owner.update_column(:points, @owner.points - 2) #decrement by 2 to account for +1 of previous vote_up
  	      @video.update_column(:points, @video.points - 2)
            else
              @owner.update_column(:points, @owner.points - 1) #decrement by 1 to account for 1 of previous vote_up
  	      @video.update_column(:points, @video.points - 1)
           end
       end
   end
	

   render :nothing => true

end  


end 
