class GroupsController < ApplicationController
  before_action :set_testsuite, only:[:edit, :update, :show, :destroy]
  before_action :require_user
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      flash[:success] = "Group added successfully"
      redirect_to group_path(@group)
    else
      render 'new'
    end      
  end
  
  def show
    
  end
  def edit
   
  end
  
  def update
     if @group.update(group_params)
      flash[:success] = "Group updated successfully"
      redirect_to group_path(@group)
    else
      render 'edit'
    end  
  end
  def index
    @groups = Group.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    @group.destroy
    flash[:danger] = "Group deleted successfully"
    redirect_to groups_path
  end
  
  private
  def group_params
    params.require(:group).permit(:name, :description)
  end
  def set_testsuite
    @group = Group.find(params[:id])
  end
  
end