class PagesController < ApplicationController
   
   def home
       redirect_to contracts_path if logged_in?
       
       
   end
    
end