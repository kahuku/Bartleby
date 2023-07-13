require 'json'

# Load the JSON file
json_data = File.read('db/spell_data.json')
spells = JSON.parse(json_data)

# Iterate over each spell and update its attributes
spells.each do |spell_data|
    spell = Spell.find_or_initialize_by(name: spell_data['name'])
    spell.update(
      pips: spell_data['pips'],
      school: spell_data['school'],
      accuracy: spell_data['accuracy'],
      damage: spell_data['damage']
    )
end