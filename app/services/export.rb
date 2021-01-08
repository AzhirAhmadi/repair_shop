class Export
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
    dir = File.join(Rails.root, 'backup_data', Date.today.to_s)
    FileUtils.mkdir_p(dir) unless File.directory?(dir)

    filepath = File.join(dir, model.table_name+'.json')
    users = @model.where().as_json
    File.open(filepath, 'w') do |f|
      f.write(JSON.pretty_generate(users))
    end
  end
end