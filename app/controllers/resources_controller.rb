class ResourcesController < ApplicationController
 
 def new
   @resource = Resource.new
 end
  
  def create
    #render plain: params[:resource].inspect
    @resource = Resource.new(resource_params)
    @resource.save
    redirect_to resource_show(@resource)
  end
  
  
  private
  def resource_params
    params.require(:resource).permit(:name, :resource_type, :description)
  end
  
  
end