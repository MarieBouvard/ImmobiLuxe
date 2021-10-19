class HousesController < ApplicationController
  include HousesHelper
  before_action :set_house, only: %i[ show edit update destroy ]
  before_action :authenticate_account!, only: [:new,:create,:destroy]
  before_action :set_sidebar, except: [:show]
  before_action :require_login, only: [:edit]
  before_action :correct_account, only: [:edit,:update,:destroy]

  # GET /houses or /houses.json
  def index
    @houses = current_account.houses.page(params[:page])
  end

  # GET /houses/1 or /houses/1.json
  def show
    @agent = @house.account
    @agent_houses = House.where(account_id: @agent.id).where.not(id: @house.id)
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
    @house = House.find(params[:id])
  end

  # POST /houses or /houses.json
  def create
    @house = House.new(house_params)
    @house.account_id = current_account.id

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: "House was successfully created." }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1 or /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: "House was successfully updated." }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1 or /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: "House was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def email_agent
    # trigger email send 
    agent_id = params[:agent_id]
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    message = params[:message]

    ContactMailer.email_agent( agent_id, first_name, last_name, email, message ).deliver_now

    # response to script
    respond_to do |format|
    format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    def set_sidebar
      @show_sidebar = true 
    end

    # Only allow a list of trusted parameters through.
    def house_params
      params.require(:house).permit(:name, :address, :price, :rooms, :bathrooms, :photo)
    end
end
