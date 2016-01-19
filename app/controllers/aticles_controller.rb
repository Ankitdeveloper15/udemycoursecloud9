class AticlesController < ApplicationController
   
   def new
       
       @aticle = Aticle.new
       
   end
   
   def create
      @aticle = Aticle.new(aticle_params)
      @aticle.save
      redirect_to aticles_show(@aticle)
      
   end
   
   private
   
    def aticle_params
       
       params.require( :aticle).permit(:title, :description)
       
    end
    
end