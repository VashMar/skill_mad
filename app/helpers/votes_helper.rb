module VotesHelper


def pressed_up
  @vote = Votes.find_vote(current_user.id, current_video.id)[0]
  if @vote 
     if(@vote.voted_up)
      @pressed_up =  "vote_arrow pressed"
     else
      @pressed_up = "vote_arrow"
     end
  else
   @pressed_up = "vote_arrow" 
  end
end



def pressed_down 
  @vote = Votes.find_vote(current_user.id, current_video.id)[0]
  if @vote 
    if(@vote.voted_down)
      @pressed_down =  "vote_arrow pressed"
    else
      @pressed_down = "vote_arrow"
    end
  else
    @pressed_down = "vote_arrow"
  end 
end

def small_mad(vid)
 @vote = Votes.find_vote(current_user.id, vid)[0]
   if @vote 
     if @vote.voted_up 
        @small_mad = "mad_small mad_clicked"
     else 
        @small_mad = "mad_small"
     end 
   else
     @smal_mad = "mad_small"
   end 
end 

def small_bad(vid)
  @vote = Votes.find_vote(current_user.id, vid)[0]
   if @vote 
     if @vote.voted_down
        @small_bad = "bad_small bad_clicked"
     else 
        @small_bad = "bad_small"
     end 
   else
     @small_bad = "bad_small"
   end 
end 



end
