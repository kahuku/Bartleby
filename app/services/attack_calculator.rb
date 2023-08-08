class AttackCalculator
  def initialize(spell_id, charm_ids, opponent_health)
    @spell = Spell.find(spell_id)
    @charms = Charm.where(id: charm_ids)
    @opponent_health = opponent_health
  end

  def calculate_damage
    total_damage = @spell.damage

    @charms.each do |charm|
      total_damage += (charm.percentage.to_f / 100) * total_damage
    end

    total_damage.to_i
  end
end
