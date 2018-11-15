CarrierWave.configure do |config|
  config.fog_provider = 'fog/google'                       # required
  config.fog_credentials = {
    provider:              'Google',                        # required
    google_storage_access_key_id:     ENV['google_storage_access_key_id'],                        # required unless using use_iam_profile
    google_storage_secret_access_key: ENV['google_storage_secret_access_key'],                        # required unless using use_iam_profile
  }
  config.fog_directory  = ENV['fog_directory']                                     # required
 
end