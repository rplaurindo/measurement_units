require 'measurement_units/version'

module MeasurementUnits

  root_path = File.expand_path("../..", __FILE__)
  lib_path = File.join(root_path, "lib")

  Dir[File.join(lib_path, "**/*.rb")].each do |file|
    # binding.pry
    require file
  end

  # :: defines declaration to doesn't nesting to MeasurementUnits module

  # module ::Rails
  #   class Application

  #     # load tasks
  #     rake_tasks do
  #       Dir[File.join(LIB_PATH, "tasks", "**/*.rake")].each do |file|
  #         load file
  #       end

  #       Dir[File.join(EXTENSIONS_PATH, "**/*.rake")].each do |file|
  #         load file
  #       end
  #     end

  #   end
  # end

  # class Application < ::Rails::Application

  # end

  # class Railtie < ::Rails::Railtie

  #   Dir[File.join(EXTENSIONS_PATH, "rails", "**/*.rb")].each do |file|
  #     require file
  #   end

  #   config.after_initialize do
  #     Dir[File.join(LIB_PATH, "**/*.rb")].each do |file|
  #       require file
  #     end
  #   end

  # end

end
