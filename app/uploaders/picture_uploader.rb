class PictureUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  process resize_to_limit: [300, 300]
  
    storage :file
  

  def store_dir
    if Rails.env.test?
      "../spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
end
