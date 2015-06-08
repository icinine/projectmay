class ContractsController < ApplicationController

    def index
        #@contracts = Contract.all.sort_by{like| like.thumbs_up_total}.reverse
        @contracts = Contract.paginate(page: params[:page], per_page: 4)
    end

    def show
       @contract = Contract.find(params[:id]) 
    end
    
    def new
    @contract = Contract.new
    end
    
    def create
       @contract = Contract.new(contract_params)
       @contract.user = User.find(3)
       
       if @contract.save
           flash[:success] = "Your Contract has been created."
           redirect_to contracts_path
       else
           render :new
       end
    end
    
    def edit
        @contract = Contract.find(params[:id])
    end
    
    def update
        @contract = Contract.find(params[:id])
        if @contract.update(contract_params)
           flash[:success] = "Your Contract was updated successfully!"
           redirect_to contract_path(@contract)
        else
            render :edit
        end
    end
    
    
    def like
      @contract = Contract.find(params[:id])
      like = Like.create(like: params[:like], user: User.first, contract: @contract)
      if like.valid?
          flash[:success] = "Thank you for your input."
          redirect_to :back
        else
          flash[:danger] = "You can only vote once."
          redirect_to :back
        end
     end
    
    private #private params for the create method
        
        def contract_params
            params.require(:contract).permit(:desc, :region, :value, :saving, :supplier, :contact, :dept, :download, :picture)
        end
    
end