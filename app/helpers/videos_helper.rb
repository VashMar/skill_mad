module VideosHelper

def top_pressed(myvid)

 if myvid == "true" || myvid == nil
  @top_pressed = ""
 else
  @top_pressed = "active_menu"
 end
end



def my_pressed(myvid)

 if myvid == "true"
    @my_pressed = "active_menu"
 else
    @my_pressed = ""
 end 

 
end

def new_pressed(n)
 
 if n == true
   @new = "active_menu"
 else
   @new = ""
 end

end

end
