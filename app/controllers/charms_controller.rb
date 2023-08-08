class CharmsController < ApplicationController
  before_action :set_charm, only: %i[show edit update destroy]

  # GET /charms
  def index
    @charms = Charm.all
    render json: @charms, status: :ok
  end

  # GET /charms/:id
  def show
    render json: @charm, status: :ok
  end

  # POST /charms
  def create
    @charm = Charm.new(charm_params)
    if @charm.save
      render json: @charm, status: :created
    else
      render json: @charm.errors, status: :unprocessable_entity
    end
  end

  # PUT /charms/:id
  def update
    if @charm.update(charm_params)
      render json: @charm, status: :ok
    else
      render json: @charm.errors, status: :unprocessable_entity
    end
  end

  # DELETE /charms/:id
  def destroy
    @charm.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_charm
    @charm = Charm.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def charm_params
    params.require(:charm).permit(:name, :school, :percentage, :pips)
  end
end
