class AttackController < ApplicationController
  before_action :check_params

  # POST /calculate_damage
  def calculate_damage
    calculator = AttackCalculator.new(
      attack_params[:spell_id].to_i,
      attack_params[:charm_ids].map(&:to_i),
      attack_params[:opponent_health].to_i
    )

    total_damage = calculator.calculate_damage

    render json: { total_damage: total_damage }
  end

  private

  def check_params
    return if attack_params[:spell_id] && attack_params[:charm_ids] && attack_params[:opponent_health]

    render json: { error: 'Missing parameters' }, status: :unprocessable_entity
  end

  def attack_params
    params.permit(:spell_id, :opponent_health, charm_ids: [])
  end
end
