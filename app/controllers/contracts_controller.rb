class ContractsController < ApplicationController
    before_action :set_contract, only: [:edit, :update, :show, :like]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update]
    
    
    def index
        #@contracts = Contract.all.sort_by{like| like.thumbs_up_total}.reverse
        @contracts = Contract.paginate(page: params[:page], per_page: 4)
    end

    def show
      
    end
    
    def new
    @contract = Contract.new
    end
    
    def create
       @contract = Contract.new(contract_params)
       @contract.user = current_user
       
       if @contract.save
           flash[:success] = "Your Contract has been created."
           redirect_to contracts_path
       else
           render :new
       end
    end
    
    def edit
      
    end
    
    def update
        
        if @contract.update(contract_params)
           flash[:success] = "Your Contract was updated successfully!"
           redirect_to contract_path(@contract)
        else
            render :edit
        end
    end
    
    
    def like
     
      like = Like.create(like: params[:like], user: current_user, contract: @contract)
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
    
        def set_contract
                 @contract = Contract.find(params[:id])
        end
        
        
        def require_same_user
            if current_user != @contract.user
                flash[:danger] = "You can only edit your own contracts"
                redirect_to contracts_path
            end
        end
    
end