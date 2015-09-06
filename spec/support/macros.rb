module Macros
  def check_aws_env
    puts "NOTICE!!! this spec requires environment value named 'AWS_ACCESS_KEY_ID'." if ENV['AWS_ACCESS_KEY_ID'].nil?
    puts "NOTICE!!! this spec requires environment value named 'AWS_SECRET_ACCESS_KEY'." if ENV['AWS_SECRET_ACCESS_KEY'].nil?
    puts "NOTICE!!! this spec requires environment value named 'ASSOCIATE_TAG'." if ENV['ASSOCIATE_TAG'].nil?
  end
end
