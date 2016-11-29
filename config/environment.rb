# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

include CarrierWave::MiniMagick

require 'carrierwave'
require 'carrierwave/orm/activerecord'
