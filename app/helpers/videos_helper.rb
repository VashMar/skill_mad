module VideosHelper

def top_pressed(myvid)

 if myvid == true 
  @top_pressed = ""
 else
  @top_pressed = "active_menu"
 end
end



def my_pressed(myvid)

 if myvid == true
 @my_pressed = "active_menu"
 else
 @my_pressed = ""
 end 
end


end
