class ResourcesController < ApplicationController
  
  before_action :set_resource, only: [:edit, :update, :show, :destroy]
 
 def new
   @resource = Resource.new
 end
  
  
  def edit
  
  end
  
  
  def update
    
    if @resource.update(resource_params)
      flash[:notice] = "Your Resource was successfully updated"
      redirect_to resource_path(@resource)
    else
      render 'edit'
    end
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
  
  end
  
  
  def index
    @resources = Resource.all
  end
  
  def destroy
  
  @resource.destroy
  flash[:notice] ="Your resource was deleted"
  redirect_to resources_path
  
  end
  
  private
  def resource_params
    params.require(:resource).permit(:name, :resource_type, :description)
  end
  
  def set_resource
    @resource = Resource.find(params[:id])
  end  
end