class TestcasesController < ApplicationController
  before_action :set_testcase, only:[:edit, :update, :show, :destroy]
  before_action :require_user
  def new
    @testcase = Testcase.new
  end
  
  def create
   @testcase = Testcase.new(testcase_params)
   @testcase.user = current_user
   if @testcase.save
     flash[:success] ="Testcase Added successfully"
     redirect_to testcase_path(@testcase)
   else
     render 'new'
   end
   
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    if @testcase.update(testcase_params)
      flash[:success] = "Testcase updated successfully"
      redirect_to testcase_path(@testcase)
    else
      render 'edit'
    end
  end
  
  def index
    @testcases = Testcase.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    @testcase.destroy
    flash[:danger] = "Testcase deleted successfully"
    redirect_to testcases_path
  end
  
  private
  def testcase_params
    params.require(:testcase).permit(:title, :description, :testsuite_id)
  end
  def set_testcase
    @testcase = Testcase.find(params[:id])
  end
end
