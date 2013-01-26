module CategoriesHelper

def all_categories
@categories = Category.all.collect{|c| [c.category_name]}
end 



end
