class Charm < ApplicationRecord
  validates_presence_of :name, :school
  validates :percentage, numericality: { only_integer: true }
  validates :school, inclusion: { in: %w[Fire Ice Storm Myth Life Death Balance] }
end
