require 'json'

charm_data = JSON.parse(File.read('db/seed_data/charm_data.json'))

charm_data.each do |charm_attributes|
  charm = Charm.new(charm_attributes)
  if charm.save
    puts "Charm '#{charm.name}' created successfully"
  else
    puts "Error creating charm '#{charm.name}': #{charm.errors.full_messages.join(', ')}"
  end
end
