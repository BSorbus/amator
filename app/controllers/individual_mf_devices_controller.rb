#
class IndividualMfDevicesController < ApplicationController
  before_action :authenticate_user!, except: [:export, :index, :datatables_index, :show]
  after_action :verify_authorized, except: [:export, :index, :datatables_index, :show]

  before_action :set_individual_mf_device, only: [:show, :edit, :update, :destroy]

  def export
    @data = IndividualMfDevice.all
  
    respond_to do |format|
      format.csv { send_data @data.to_csv, filename: "individual_mf_devices_#{Time.zone.today.strftime('%Y-%m-%d')}.csv" }
      #format.csv { send_data @individuals.to_csv, filename: "ra_individuals_#{Time.zone.new().strftime("%Y-%m-%d")}.csv" }
    end
  end

  # GET /individual_mf_devices
  # GET /individual_mf_devices.json
  def index
    respond_to do |format|
      format.html
      format.json
    end   
  end

  # POST /individuals
  def datatables_index
    #data_scope = current_user.admin? ? -1 : current_user.id
    respond_to do |format|
      format.json { render json: IndividualMfDeviceDatatable.new(view_context) }
    end
  end

  # GET /individual_mf_devices/1
  # GET /individual_mf_devices/1.json
  def show
    # show
  end

  # GET /individual_mf_devices/new
  def new
    @individual_mf_device = IndividualMfDevice.new
    authorize @individual_mf_device
  end

  # GET /individual_mf_devices/1/edit
  def edit
    authorize @individual_mf_device
  end

  # POST /individual_mf_devices
  # POST /individual_mf_devices.json
  def create
    @individual_mf_device = IndividualMfDevice.new(individual_mf_device_params)
    authorize @individual_mf_device

    respond_to do |format|
      if @individual_mf_device.save
        format.html { redirect_to @individual_mf_device, notice: t('activerecord.messages.successfull.created', data: @individual_mf_device.fullname) }
        format.json { render :show, status: :created, location: @individual_mf_device }
      else
        format.html { render :new }
        format.json { render json: @individual_mf_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /individual_mf_devices/1
  # PATCH/PUT /individual_mf_devices/1.json
  def update
    authorize @individual_mf_device

    respond_to do |format|
      if @individual_mf_device.update(individual_mf_device_params)
        format.html { redirect_to @individual_mf_device, notice: t('activerecord.messages.successfull.updated', data: @individual_mf_device.fullname) }
        format.json { render :show, status: :ok, location: @individual_mf_device }
      else
        format.html { render :edit }
        format.json { render json: @individual_mf_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individual_mf_devices/1
  # DELETE /individual_mf_devices/1.json
  def destroy
    authorize @individual_mf_device
    
    if @individual_mf_device.destroy
      redirect_to individuals_mf_device_url, notice: t('activerecord.messages.successfull.destroyed', data: @individual_mf_device.fullname) 
    else 
      flash[:error] = t('activerecord.messages.error.destroyed', data: @individual_mf_device.fullname)
      render :show
    end      
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual_mf_device
      @individual_mf_device = IndividualMfDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def individual_mf_device_params
      params.require(:individual_mf_device).permit(:number, :date_of_issue, :valid_to, :call_sign, :category, :transmitter_power, :name_type_station, :emission, :input_frequency, :output_frequency, :station_location)
    end
end
