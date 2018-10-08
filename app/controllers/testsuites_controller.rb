class TestsuitesController < ApplicationController
  def new
    @testsuite = Testsuite.new
  end
  def create
    @testsuite = Testsuite.new(testsuite_params)
    @testsuite.user = User.first #Temporarily adding first user
    if @testsuite.save
      flash[:success] ="Testsuite created uccessfully"
      redirect_to testsuite_path(@testsuite)
    else
      render 'new'
    end
  end
  def edit
    @testsuite = Testsuite.find(params[:id])
  end
  
  def update
    @testsuite = Testsuite.find(params[:id])
    if @testsuite.update(testsuite_params)
      flash[:success] ="Testsuite updated successfully"
      redirect_to testsuite_path(@testsuite)
    else
      render 'edit'
    end
  end
  
  def show
    @testsuite = Testsuite.find(params[:id])
  end
  
  def index
#     @testsuites = Testsuite.all
    @testsuites = Testsuite.paginate(page: params[:page], per_page: 5)
  end
  def destroy
    @testsuite = Testsuite.find(params[:id])
    @testsuite.destroy
    flash[:danger] = "Testsuite deleted successfully"
    redirect_to testsuites_path
  end
  
  private
  def testsuite_params
     params.require(:testsuite).permit(:title, :description)
  end
end