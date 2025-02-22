class Api::SpottingsController < ApplicationController
  before_action :validate_spotting_params, only: [:create]

  # GET /spottings
  def index
    @spottings = Spotting.all
    render json: @spottings
  end

  # GET /spottings/:id
  def show
    @spotting = Spotting.find(params[:id])
    render json: @spotting
  end

  # POST /spottings
  def create
    @spotting = Spotting.new(spotting_params)
    if @spotting.save
      render json: @spotting, status: :created
    else
      render json: @spotting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spottings/:id
  def update
    @spotting = Spotting.find(params[:id])
    if @spotting.update(spotting_params)
      render json: @spotting
    else
      render json: @spotting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spottings/:id
  def destroy
    @spotting = Spotting.find(params[:id])
    @spotting.destroy
    head :no_content
  end

  private

  def validate_spotting_params
    required_params = [:location, :user_id, :animal_id]
    missing_params = required_params.select { |param| params[:spotting][param].blank? }
    if missing_params.any?
      render json: { error: "Missing required parameters: #{missing_params.join(', ')}" }, status: :unprocessable_entity
    end
  end

  def spotting_params
    params.require(:spotting).permit(:location, :image, :user_id, :animal_id)
  end
end
