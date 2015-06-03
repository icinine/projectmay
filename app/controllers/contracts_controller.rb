class ContractsController < ApplicationController

    def index
        @contracts = Contract.all
    end

    def show
       @contract = Contract.find(params[:id]) 
    end
end
