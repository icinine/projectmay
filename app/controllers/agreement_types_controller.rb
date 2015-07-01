class AgreementTypesController < ApplicationController
   before_action :require_user, except: [:show]
   
   def show
      @agreement_type = AgreementType.find(params[:id])
      @contracts = @agreement_type.contracts.paginate(page: params[:page], per_page: 4)
   end
   
   
   def new
        @agreement_type = AgreementType.new
   end
   
   def create
      @agreement_type = AgreementType.new(agree_params)
      if @agreement_type.save
         flash[:success] = "Agreement-type successfully added"
         redirect_to contracts_path
      else
         render 'new'
      end
   end
   
   def show
      
   end
   
    private
    
    def agree_params
      params.require(:agreement_type).permit(:name)
    end
    
end