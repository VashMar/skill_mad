module CategoriesHelper


def all_categories

@categories = Category.all.collect{|c| [c.category_name]}

end 

 

def current_category(cat)
@current_category = cat
end 


def current_category
@current_category ||= nil
end 

end
