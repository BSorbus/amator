#
require 'pwid'

class IndividualsController < ApplicationController
  before_action :authenticate_user!, except: [:import_now, :export, :index, :datatables_index, :show]
  after_action :verify_authorized, except: [:import_now, :export, :index, :datatables_index, :show]

  before_action :set_individual, only: [:show, :edit, :update, :destroy]

  def export
    @data = Individual.all
      respond_to do |format|
      format.csv { send_data @data.to_csv, filename: "individuals_#{Time.zone.today.strftime("%Y-%m-%d")}.csv" }
    end
  end

  # GET /import_now
  def import_now
    flash[:notice] = 'Aktualizacja danych zakończona!'
    render :inline => "#{PwidModule::output_shell}"
  end

  # GET /individuals
  # GET /individuals.json
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
      format.json { render json: IndividualDatatable.new(view_context) }
    end
  end

  # GET /individuals/1
  # GET /individuals/1.json
  def show
    # show
  end

  # GET /individuals/new
  def new
    @individual = Individual.new
    authorize @individual
  end

  # GET /individuals/1/edit
  def edit
    authorize @individual
  end

  # POST /individuals
  # POST /individuals.json
  def create
    @individual = Individual.new(individual_params)
    authorize @individual

    respond_to do |format|
      if @individual.save
        format.html { redirect_to @individual, notice: t('activerecord.messages.successfull.created', data: @individual.fullname) }
        format.json { render :show, status: :created, location: @individual }
      else
        format.html { render :new }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /individuals/1
  # PATCH/PUT /individuals/1.json
  def update
    authorize @individual

    respond_to do |format|
      if @individual.update(individual_params)
        format.html { redirect_to @individual, notice: t('activerecord.messages.successfull.updated', data: @individual.fullname) }
        format.json { render :show, status: :ok, location: @individual }
      else
        format.html { render :edit }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individuals/1
  # DELETE /individuals/1.json
  def destroy
    authorize @individual

    if @individual.destroy
      redirect_to individuals_url, notice: t('activerecord.messages.successfull.destroyed', data: @individual.fullname)
    else
      flash[:error] = t('activerecord.messages.error.destroyed', data: @individual.fullname)
      render :show
    end
  end

  private

    def set_individual
      @individual = Individual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def individual_params
      params.require(:individual).permit(:number, :date_of_issue, :valid_to, :call_sign, :category, :transmitter_power, :station_location)
    end
end
