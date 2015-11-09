require 'carrierwave'
require 'carrierwave/datamapper'

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  CarrierWave.configure do |config|
    config.root = "#{Dir.pwd}/uploads"
  end

  def extensions_white_list
    %w(jpg jpeg gif png)
  end

  storage :file
end

class Photo
  include Lotus::Entity
  include DataMapper::Resource

  property :id, Serial
  property :product_id, Integer

  mount_uploader :file, PhotoUploader

  DataMapper.finalize
end