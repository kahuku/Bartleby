require 'json'

spell_data = JSON.parse(File.read('db/seed_data/spell_data.json'))

spell_data.each do |spell_attributes|
  spell = Spell.new(spell_attributes)
  if spell.save
    puts "Spell '#{spell.name}' created successfully"
  else
    puts "Error creating spell '#{spell.name}': #{spell.errors.full_messages.join(', ')}"
  end
end
