class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick


  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  def default_url(*args)
    ActionController::Base.helpers.asset_path("/assets/" + [version_name, "default-avatar.jpg"].compact.join('_'))
  end

  # Process files as they are uploaded:
  # process :resize_to_fit => [100, 150]
  #
  # def scale(width, height)
  #   # do something
  # end



  # Process files as they are uploaded:
   #   process :resize_to_fit => [100, 150]

    #  def safe_scale(width, height)
    #      resize_to_limit(width, height)
    #  end


  # Create different versions of your uploaded files:
  # version :thumbnail do
  # process :resize_to_fill => [100, 150]
  # end

  # version :medium do
  #  process :resize_to_fill => [300, 300]
  # end

  # version :small do
  #  process :resize_to_fill => [140, 140]
  # end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
     %w(jpg jpeg gif png bmp)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
