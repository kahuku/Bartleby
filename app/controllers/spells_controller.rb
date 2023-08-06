class SpellsController < ApplicationController
  before_action :set_spell, only: %i[show edit update destroy]

  # GET /spells
  def index
    @spells = Spell.all
    render json: @spells, status: :ok
  end

  # GET /spells/:id
  def show
    render json: @spell, status: :ok
  end

  # POST /spells
  def create
    @spell = Spell.new(spell_params)
    if @spell.save
      render json: @spell, status: :created
    else
      render json: @spell.errors, status: :unprocessable_entity
    end
  end

  # PUT /spells/:id
  def update
    if @spell.update(spell_params)
      render json: @spell, status: :ok
    else
      render json: @spell.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spells/:id
  def destroy
    @spell.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_spell
    @spell = Spell.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def spell_params
    params.require(:spell).permit(:name, :pips, :school, :accuracy, :damage)
  end
end
