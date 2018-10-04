class TestcasesController < ApplicationController
  def new
    @testcase = Testcase.new
  end
  
  def create
   @testcase = Testcase.new(testcase_params)
   if @testcase.save
     flash[:success] ="Testcase Added successfully"
     redirect_to testcase_path(@testcase)
   else
     render 'new'
   end
   
  end
  
  def show
    @testcase = Testcase.find(params[:id])
  end
  def edit
    @testcase = Testcase.find(params[:id])
  end
  
  def update
    @testcase = Testcase.find(params[:id])
    if @testcase.update(testcase_params)
      flash[:success] = "Testcase updated successfully"
      redirect_to testcase_path(@testcase)
    else
      render 'edit'
    end
  end
  
  def index
    @testcases = Testcase.all
  end
  
  def destroy
    @testcase = Testcase.find(params[:id])
    @testcase.destroy
    flash[:danger] = "Testcase deleted successfully"
    redirect_to testcases_path
  end
  
  private
  def testcase_params
    params.require(:testcase).permit(:title, :description)
  end
end
