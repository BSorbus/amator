class ClubsController < ApplicationController
  before_action :authenticate_user!, except: [:export, :index, :datatables_index, :show]
  after_action :verify_authorized, except: [:export, :index, :datatables_index, :show]

  before_action :set_club, only: [:show, :edit, :update, :destroy]


  def export
    @data = Club.all
  
    respond_to do |format|
      format.csv { send_data @data.to_csv, filename: "clubs_#{Time.zone.today.strftime("%Y-%m-%d")}.csv" }
      #format.csv { send_data @individuals.to_csv, filename: "ra_individuals_#{Time.zone.new().strftime("%Y-%m-%d")}.csv" }
    end
  end

  # GET /individuals
  # GET /individuals.json
  def index
    respond_to do |format|
      format.html
    end   
  end

  # POST /clubs
  def datatables_index
    #data_scope = current_user.admin? ? -1 : current_user.id
    respond_to do |format|
      format.json{ render json: ClubDatatable.new(view_context) }
    end
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    @other_club_stations = @club.nearbys(25)
    #@other_stations = Location.near(params[:search], 50, :order => :distance)
  end

  # GET /clubs/new
  def new
    @club = Club.new
    authorize @club
  end

  # GET /clubs/1/edit
  def edit
    authorize @club
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)
    authorize @club

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: t('activerecord.messages.successfull.created', data: @club.fullname) }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    authorize @club

    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: t('activerecord.messages.successfull.updated', data: @club.fullname) }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    authorize @club

    if @club.destroy
      redirect_to clubs_url, notice: t('activerecord.messages.successfull.destroyed', data: @club.fullname) 
    else 
      flash[:error] = t('activerecord.messages.error.destroyed', data: @club.fullname)
      render :show
    end      
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:department, :number, :date_of_issue, :valid_to, :call_sign, :category, :transmitter_power, :operator_1, :operator_2, :operator_3, :enduser_name, :enduser_city, :enduser_street, :enduser_house, :enduser_number, :applicant_name, :applicant_city, :applicant_street, :applicant_house, :applicant_number, :station_city, :station_street, :station_house, :station_number, :lat, :lng)
    end
end
