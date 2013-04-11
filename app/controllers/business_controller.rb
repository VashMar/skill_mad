class BusinessController < ApplicationController




def show
render 'business/business_contact'
end 


def business_email 
    UserMailer.business_email(params[:business_name], params[:contact], params[:description]).deliver 
    flash[:success] = "Thank you for interest in using skillmad to promote your cause! We will be in touch!"
    redirect_to home_url	
end 


def terms
render 'layouts/terms'
end




end 
