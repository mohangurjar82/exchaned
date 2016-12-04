class ResourcesController < ApplicationController
  
  before_action :set_resource, only: [:edit, :update, :show, :destroy, :download]
  before_action :require_same_user, except: [:index, :show] 
  before_action :require_same_user, only: [:edit, :update, :destroy]
 
 def new
   @resource = Resource.new
 end
  
  
  def edit
  
  end
  
  
  def update
    
    if @resource.update(resource_params)
      flash[:success] = "Your Resource was successfully updated"
      redirect_to resource_path(@resource)
    else
      render 'edit'
    end
  end
  
  def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user
    if @resource.save
    flash[:success] = "Your Resource has been saved sucessfully"
    redirect_to resource_path(@resource)
  else
    render 'new'
    end
  end
  
  def show

  end
  
  
  def index
  @resources = Resource.paginate(page: params[:page], per_page: 4)
  end
  
  def destroy
  @resource.destroy
  flash[:danger] ="Your resource was deleted"
  redirect_to resources_path
  end
  
  def download
    current_user.downloaded_resources.create(:resource_id => @resource.id) unless (current_user.resources.map(&:id).include? params["id"].to_i)
    render layout: false
  end  

  private
  def resource_params
    params.require(:resource).permit(:name, :resource_type, :description, :picture)
  end
  
  def set_resource
    @resource = Resource.find(params[:id])
  end  
  
  
    def require_same_user
    if current_user != @resource.user and !current_user.admin?
      flash[:danger] = "You can only change your own resources"
      redirect_to root_path
    end
  
   end 
end

