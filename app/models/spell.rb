class Spell < ApplicationRecord
  validates_presence_of :name, :pips, :school, :accuracy, :damage
end
