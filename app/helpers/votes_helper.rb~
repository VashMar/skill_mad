module VotesHelper


def pressed_up
if(Votes.find_vote(current_user.id, current_video.id)[0])
  @vote = Votes.find_vote(current_user.id, current_video.id)[0]
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
if(Votes.find_vote(current_user.id, current_video.id)[0])
  @vote = Votes.find_vote(current_user.id, current_video.id)[0]
  if(@vote.voted_down)
    @pressed_down =  "vote_arrow pressed"
    else
    @pressed_down = "vote_arrow"
  end
  else
  @pressed_down = "vote_arrow"
end 
end

end
