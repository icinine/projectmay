class ContractsController < ApplicationController

    def index
        @contracts = Contract.all
    end

    def show
       @contract = Contract.find(params[:id]) 
    end
    
    def new
    @contract = Contract.new
    end
    
    def create
       binding.pry 
    end
    
end
