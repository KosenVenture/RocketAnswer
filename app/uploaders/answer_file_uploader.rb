# encoding: utf-8

class AnswerFileUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick  

  # Choose what kind of storage to use for this uploader:
  storage :file

  version :thumb do
    process resize_to_fit: [200, 200]
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png pdf)
  end
end
