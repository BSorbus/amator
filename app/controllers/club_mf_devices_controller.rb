class ClubMfDevicesController < ApplicationController
  before_action :authenticate_user!, except: [:export, :index, :datatables_index, :show]
  after_action :verify_authorized, except: [:export, :index, :datatables_index, :show]

  before_action :set_club_mf_device, only: [:show, :edit, :update, :destroy]


  def export
    @data = ClubMfDevice.all
  
    respond_to do |format|
      format.csv { send_data @data.to_csv, filename: "club_mf_devices_#{Time.zone.today.strftime("%Y-%m-%d")}.csv" }
      #format.csv { send_data @individuals.to_csv, filename: "ra_individuals_#{Time.zone.new().strftime("%Y-%m-%d")}.csv" }
    end
  end

  # GET /club_mf_devices
  # GET /club_mf_devices.json
  def index
    respond_to do |format|
      format.html
    end   
  end

  # POST /clubs
  def datatables_index
    #data_scope = current_user.admin? ? -1 : current_user.id
    respond_to do |format|
      format.json{ render json: ClubMfDeviceDatatable.new(view_context) }
    end
  end
 
  # GET /club_mf_devices/1
  # GET /club_mf_devices/1.json
  def show
    @other_club_mf_device_stations = @club_mf_device.nearbys(25)
  end

  # GET /club_mf_devices/new
  def new
    @club_mf_device = ClubMfDevice.new
    authorize @club_mf_device
  end

  # GET /club_mf_devices/1/edit
  def edit
    authorize @club_mf_device
  end

  # POST /club_mf_devices
  # POST /club_mf_devices.json
  def create
    @club_mf_device = ClubMfDevice.new(club_mf_device_params)
    authorize @club_mf_device

    respond_to do |format|
      if @club_mf_device.save
        format.html { redirect_to @club_mf_device, notice: t('activerecord.messages.successfull.created', data: @club_mf_device.fullname) }
        format.json { render :show, status: :created, location: @club_mf_device }
      else
        format.html { render :new }
        format.json { render json: @club_mf_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /club_mf_devices/1
  # PATCH/PUT /club_mf_devices/1.json
  def update
    authorize @club_mf_device

    respond_to do |format|
      if @club_mf_device.update(club_mf_device_params)
        format.html { redirect_to @club_mf_device, notice: t('activerecord.messages.successfull.updated', data: @club_mf_device.fullname) }
        format.json { render :show, status: :ok, location: @club_mf_device }
      else
        format.html { render :edit }
        format.json { render json: @club_mf_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /club_mf_devices/1
  # DELETE /club_mf_devices/1.json
  def destroy
    authorize @club_mf_device


    if @club_mf_device.destroy
      redirect_to club_mf_devices_url, notice: t('activerecord.messages.successfull.destroyed', data: @club_mf_device.fullname) 
    else 
      flash[:error] = t('activerecord.messages.error.destroyed', data: @club_mf_device.fullname)
      render :show
    end      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_mf_device
      @club_mf_device = ClubMfDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_mf_device_params
      params.require(:club_mf_device).permit(:department, :number, :date_of_issue, :valid_to, :call_sign, :category, :transmitter_power, :name_type_station, :emission, :input_frequency, :output_frequency, :operator_1, :operator_2, :operator_3, :enduser_name, :enduser_city, :enduser_street, :enduser_house, :enduser_number, :applicant_name, :applicant_city, :applicant_street, :applicant_house, :applicant_number, :station_city, :station_street, :station_house, :station_number)
    end
end
