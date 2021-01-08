class Import
  attr_accessor :model

  def self.call(*args)
    new(*args).call
  rescue StandardError => e
    Rails.logger.error e.message
  end

  def initialize(model)
    @model = model
  end

  def call
    backup_data_path = File.join(Rails.root, 'backup_data')
    last_backup = Dir.entries(backup_data_path)
    .select {|entry| !(entry =='.' || entry == '..') }
    .select {|entry| File.directory?(File.join(backup_data_path, entry))}
    .sort {|a,b| a <=> b}.last


    filepath = File.join(backup_data_path, last_backup, model.table_name+'.json')
    abort "Input file not found: #{filepath}" unless File.exist?(filepath)

    model.destroy_all
    JSON.parse(File.read(filepath)).deep_symbolize_keys[:scope].each do |data|
      model.create(data)
    end
  end
end