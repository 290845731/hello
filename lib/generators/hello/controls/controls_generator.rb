class Hello::ControlsGenerator < Rails::Generators::Base
  # source_root File.expand_path('../templates', __FILE__)
  source_root File.expand_path("../../../../../", __FILE__)

  def copy_the_controls
    directory "app/authentication"
  end



  protected

end