class ContractsController < ApplicationController
    before_action :set_contract, only: [:edit, :update, :show, :like]
    before_action :require_user, except: [:show, :index, :like]
    before_action :require_user_like, only: [:like]
    before_action :require_same_user, only: [:edit, :update]
    before_action :admin_user, only: :destroy
    
    
    def index
        @contracts = Contract.search(params[:search]).paginate(page: params[:page], per_page: 4)
       
       #Calculate contract savings
        @savo = Contract.all
        @savings = @savo.sum(:saving)
        
    #Calculate value of contract on system
        @value = @savo.sum(:value)
        
    #Count number of contract on system
        @concount = @contracts.count
        
        
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
    
    def destroy
       Contract.find(params[:id]).destroy 
       flash[:success] = "Contract Deleted"
       redirect_to contracts_path
    end
    
    private #private params for the create method
        
        def contract_params
            params.require(:contract).permit(:desc, :value, :saving, :supplier_id, :contact, :dept_id, :download, :picture, :attachment, :dateFrom, :dateTo, :search, agreement_type_ids: [], region_ids: [])
        end
    
        def set_contract
                 @contract = Contract.find(params[:id])
        end
        
        
        def require_same_user
            if current_user != @contract.user and !current_user.admin?
                flash[:danger] = "You can only edit your own contracts"
                redirect_to contracts_path
            end
        end
        
        
         def require_user_like
            if !logged_in?
              flash[:danger] = "You must be logged in to perform that action"
              redirect_to :back
            end
         end
         
         def admin_user
            redirect_to contracts_path unless current_user.admin? 
         end
    
end