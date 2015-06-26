class IndividualMfDevicesController < ApplicationController
  before_action :set_individual_mf_device, only: [:show, :edit, :update, :destroy]

  # GET /individual_mf_devices
  # GET /individual_mf_devices.json
  def index
    respond_to do |format|
      format.html
    end   
  end

  # POST /individuals
  def datatables_index
    #data_scope = current_user.admin? ? -1 : current_user.id
    respond_to do |format|
      format.json{ render json: IndividualMfDeviceDatatable.new(view_context) }
    end
  end

  # GET /individual_mf_devices/1
  # GET /individual_mf_devices/1.json
  def show
  end

  # GET /individual_mf_devices/new
  def new
    @individual_mf_device = IndividualMfDevice.new
  end

  # GET /individual_mf_devices/1/edit
  def edit
  end

  # POST /individual_mf_devices
  # POST /individual_mf_devices.json
  def create
    @individual_mf_device = IndividualMfDevice.new(individual_mf_device_params)

    respond_to do |format|
      if @individual_mf_device.save
        format.html { redirect_to @individual_mf_device, notice: 'Individual mf device was successfully created.' }
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
    respond_to do |format|
      if @individual_mf_device.update(individual_mf_device_params)
        format.html { redirect_to @individual_mf_device, notice: 'Individual mf device was successfully updated.' }
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
    @individual_mf_device.destroy
    respond_to do |format|
      format.html { redirect_to individual_mf_devices_url, notice: 'Individual mf device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual_mf_device
      @individual_mf_device = IndividualMfDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def individual_mf_device_params
      params.require(:individual_mf_device).permit(:department, :number, :date_of_issue, :valid_to, :call_sign, :category, :transmitter_power, :name_type_station, :emission, :input_frequency, :output_frequency, :operator_1, :operator_2, :operator_3, :station_location)
    end
end
