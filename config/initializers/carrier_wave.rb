if Rails.env.production?
    CarrierWave.configure do |config|
       config.aws_credentials = {
        :provider => 'AWS',
        :access_key_id => ENV['S3_ACCESS_KEY'],
        :secret_access_key => ENV['S3_SECRET_KEY']
       } 
       
      config.aws_bucket = ENV['S3_BUCKET']
      
    end
    
end