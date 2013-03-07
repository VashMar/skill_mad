module CategoriesHelper


def all_categories

@categories = Category.order("rank ASC")

end 

def all_categories_upload

@categories = Category.order("rank ASC").collect{|c| [c.category_name]}
@categories.unshift(["Select a category to upload to!"])

end 
 

def current_category(cat)
@current_category = cat
end 


def current_category
@current_category ||= nil
end 

end
