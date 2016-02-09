class AticlesController < ApplicationController
   
   before_action :set_aticle, only: [:edit, :update, :show, :destroy]
   before_action :require_user, except: [:index, :show]
   before_action :require_same_user, only: [:edit, :update, :destroy]
   
    def index
      @aticles = Aticle.paginate(page: params[:page], per_page: 5)
    end

    def new
       
       @aticle = Aticle.new
       
    end
   
    def create
      
      @aticle = Aticle.new(aticle_params)
      @aticle.user=current_user
      if @aticle.save
         
         flash[:success] = "Article was created successfully"
      redirect_to aticle_path(@aticle)
      
      else
         render 'new'
      end
    end
    
    def show
       
    end
    
    def edit
     
    end
    
    def update
     
        if @aticle.update(aticle_params)
         flash[:success] = "Article was successfully updated"
         redirect_to aticle_path(@aticle)
        else
         render 'edit'
        end
    end
    
    def destroy
      
      @aticle.destroy
      flash[:danger] = "Article was successfully deleted"
      redirect_to aticles_path
    end
    

    private
    
    def set_aticle
     @aticle = Aticle.find(params[:id])
    end
    
    def aticle_params
       
       params.require( :aticle).permit(:title, :description)
    end
    
    def require_same_user
        if current_user != @aticle.user and !current_user.admin?
         flash[:danger] = "You can only edit or delete your own articles"
         redirect_to root_path
        end
    end
    
end