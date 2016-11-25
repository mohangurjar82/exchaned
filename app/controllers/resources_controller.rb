class ResourcesController < ApplicationController
 
 def new
   @resource = Resource.new
 end
  
  def create
    @resource = Resource.new(resource_params)
    if @resource.save
    flash[:notice] = "Your Resource has been saved sucessfully"
    redirect_to resource_path(@resource)
  else
    render 'new'
    end
  end
  
  def show
  @resource = Resource.find(params[:id])
  end
  
  private
  def resource_params
    params.require(:resource).permit(:name, :resource_type, :description)
  end
  
  
end