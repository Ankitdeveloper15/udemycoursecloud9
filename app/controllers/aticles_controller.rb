class AticlesController < ApplicationController
   
   def new
       
       @aticle = Aticle.new
       
   end
   
   def create
      
      @aticle = Aticle.new(aticle_params)
      if @aticle.save
         
         flash[:notice] = "Article was created successfully"
      redirect_to aticle_path(@aticle)
      
      else
         render 'new'
      end
    end
    
    def show
       
       @aticle = Aticle.find(params[:id])
       
    end
   
   private
   
    def aticle_params
       
       params.require( :aticle).permit(:title, :description)
       
    end
    
end