class ImageUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def scale(width, height)
  #   # do something
  # end

  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

end
