class Charm < ApplicationRecord
  validates_presence_of :name, :percentage
  validates :percentage, numericality: { only_integer: true }
  validates :school, inclusion: { in: %w[Fire Ice Storm Myth Life Death Balance], allow_blank: true }
end
