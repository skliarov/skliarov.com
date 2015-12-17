require 'carrierwave'

class CkeditorPictureUploader < CarrierWave::Uploader::Base
  include Ckeditor::Backend::CarrierWave
  include CarrierWave::MiniMagick
  
  # Choose what kind of storage to use for this uploader:
  storage :file
  
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/ckeditor/pictures/#{model.id}"
  end
  
  process :read_dimensions
  
  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fill: [118, 100]
  end
  
  version :content do
    process resize_to_limit: [800, 800]
  end
  
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    Ckeditor.image_file_types
  end
end