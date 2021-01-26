require 'json'

# Assuming a file "path/to/aws_secrets.json" with contents like:
#
#     { "AccessKeyId": "YOUR_KEY_ID", "SecretAccessKey": "YOUR_ACCESS_KEY" }
#
# Remember to exclude "path/to/aws_secrets.json" from version control, e.g. by
# adding it to .gitignore
# secrets = JSON.load(File.read('path/to/aws_secrets.json'))
creds = Aws::Credentials.new(ENV['SMTP_USER_NAME'], ENV['SMTP_PASSWORD'])

Aws::Rails.add_action_mailer_delivery_method(
  :ses,
  credentials: creds,
  region: 'us-east-1'
)

Aws::Rails::SqsActiveJob.configure do |config|
    config.logger = ActiveSupport::Logger.new(STDOUT)
    config.max_messages = 5
    config.client = Aws::SQS::Client.new(region: 'us-east-1')
  end