class AgreementTypesController < ApplicationController
   
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
      params.require(:agreement_type).permit(:doctype)
    end
    
end