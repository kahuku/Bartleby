class Spell < ApplicationRecord
  validates_presence_of :name, :pips, :school, :accuracy, :damage
  validates :school, inclusion: { in: %w[Fire Ice Storm Myth Life Death Balance] }
end
