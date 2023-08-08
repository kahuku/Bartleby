require 'json'

# Load the JSON file
json_data = File.read('db/charm_data.json')
charms = JSON.parse(json_data)

# Iterate over each charm and update its attributes
charms.each do |charm_data|
  charm = Charm.find_or_initialize_by(name: charm_data['name'])
  charm.update(
    school: charm_data['school'],
    percentage: charm_data['percentage']
  )
end
