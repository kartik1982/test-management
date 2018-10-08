class TestsuitesController < ApplicationController
  before_action :set_testsuite, only:[:edit, :update, :show, :destroy]
  before_action :require_user
  def new
    @testsuite = Testsuite.new
  end
  def create
    @testsuite = Testsuite.new(testsuite_params)
    @testsuite.user = current_user
    if @testsuite.save
      flash[:success] ="Testsuite created uccessfully"
      redirect_to testsuite_path(@testsuite)
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @testsuite.update(testsuite_params)
      flash[:success] ="Testsuite updated successfully"
      redirect_to testsuite_path(@testsuite)
    else
      render 'edit'
    end
  end
  
  def show
    @testsuite_testcases = @testsuite.testcases.paginate(page: params[:page], per_page: 5)
  end
  
  def index
#     @testsuites = Testsuite.all
    @testsuites = Testsuite.paginate(page: params[:page], per_page: 5)
  end
  def destroy
    @testsuite.destroy
    flash[:danger] = "Testsuite deleted successfully"
    redirect_to testsuites_path
  end
  
  private
  def testsuite_params
     params.require(:testsuite).permit(:title, :description)
  end
  def set_testsuite
    @testsuite = Testsuite.find(params[:id])
  end
end