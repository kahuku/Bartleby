class CharmsController < ApplicationController
  before_action :set_charm, only: %i[show edit update destroy]

  # GET /charms
  def index
    @charms = Charm.all
    render json: @charms, status: :ok
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
    params.require(:charm).permit(:name, :school, :percentage)
  end
end
