class DevicesController <ApplicationController
  before_action :set_device, only:[:edit, :update, :show, :destroy]
  def new
    @device = Device.new
  end
  
  def create
    @device = Device.new(params_device)
    @device.user = current_user
    if @device.save
      flash[:success] ="Device added successfully"
      redirect_to device_path(@device)
    else
      render 'new'
    end
  end
  
  def show
     
  end
  
  def index
    @devices = Device.paginate(page: params[:page], per_page: 5)
  end
  
  def edit
    
  end
  
  def update
    if @device.update(params_device)
      flash[:success] ="Device updated successfully"
      redirect_to device_path(@device)
    else
      render 'edit'
    end
  end
  def destroy
    @device.destroy
    flash[:danger] = "Device deleted successfully"
    redirect_to devices_path
  end
  
  private
  def params_device
    params.require(:device).permit(:devicetype, :name, :description, :status, :group_id)
  end
  
  def set_device
    @device = Device.find(params[:id])
  end
  
end