# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :card do
    resize_to_fit 600, 600
  end

  version :banner do
    resize_to_fit 1600, 1600
  end

end
