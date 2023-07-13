class SpellsController < ApplicationController
  before_action :set_spell, only: %i[ show edit update destroy ]

  # GET /spells or /spells.json
  def index
    @spells = Spell.all
    render json: @spells, status: :ok
  end

  # GET /spells/1 or /spells/1.json
  def show
    render json: @spell, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spell
      @spell = Spell.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spell_params
      params.require(:spell).permit(:name, :pips, :school, :accuracy, :damage)
    end
end
