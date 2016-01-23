class AticlesController < ApplicationController
   
   
    def index
       @aticles = Aticle.all
    end

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
    
    def edit
     @aticle = Aticle.find(params[:id])
    end
    
    def update
      @aticle = Aticle.find(params[:id])
        if @aticle.update(aticle_params)
         flash[:notice] = "Article was successfully updated"
         redirect_to aticle_path(@aticle)
        else
         render 'edit'
        end
    end
    
    def destroy
      @aticle = Aticle.find(params[:id])
      @aticle.destroy
      flash[:notice] = "Article was successfully deleted"
      redirect_to aticles_path
    end
    

    private
    
    def aticle_params
       
       params.require( :aticle).permit(:title, :description)
       
    end
    
end