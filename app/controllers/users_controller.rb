class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update, :show]
  def new
    @user = User.new  
  end
  
  def index
#     @users = User.all
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] ="User get added into system sccuessfully"
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def edit

  end
  def update
    if @user.update(user_params)
      flash[:success] = "User updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  def show
    @user_testcases = @user.testcases.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User deleted successfully"
    redirect_to users_path
  end
  
  private
  def user_params
  params.require(:user).permit(:username, :email, :password)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
