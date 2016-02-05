# Use this hook to configure impressionist parameters
#Impressionist.setup do |config|
  # Define ORM. Could be :active_record (default), :mongo_mapper or :mongoid
  # config.orm = :active_record
#end

ActiveRecord::Base.send(:define_method, 'created_at_date') do
  self.created_at.to_date
end