class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update, :show]
  before_action :require_same_user, only:[:edit, :update]
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
      redirect_to user_path(@user)
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
#     @user_testcases = @user.testcases.paginate(page: params[:page], per_page: 5)
    @user_testsuites = @user.testsuites.paginate(page: params[:page], per_page: 5)
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
  def require_same_user
    if current_user != @user
    flash[:danger] = "You can only edit your own account"
    redirect_to root_path
    end
  end
end
