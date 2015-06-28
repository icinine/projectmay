class RegionsController < ApplicationController

def new
    @region = Region.new
end

def create
    @region = Region.new(region_params)
    if @region.save
        flash[:success] = "Region created successfully"
        redirect_to contracts_path
    else
        render 'new'
    end
end

private

def region_params
   params.require(:region).permit(:name) 
end
    
end
