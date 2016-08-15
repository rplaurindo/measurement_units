lib = File.expand_path('../../../../../lib', __FILE__)
$LOAD_PATH.unshift(lib)

require "measurement_units/is/decimal"
require "measurement_units/is/decimal/mass/pt_br"
require "measurement_units/is/decimal/volume/pt_br"

module MeasurementUnits
  module IS
    module Decimal

      module PtBR

        extend self

        def humanize_for value, unit_type
          # convert what is in database to mg or ml
          value = Decimal.to_units_after value, 3

          "#{resolve value, unit_type}"
        end

        private
          def resolve value, unit_type
            case unit_type.to_sym
              when :volume then
                if value < 1000
                  "#{(value.to_f/100).formated} #{weight_units[:ml]}"
                else
                  if value === 1000 || value < 2000
                    unit = weight_units[:l]
                  else
                    unit = pluralize weight_units[:l]
                  end

                  "#{(value.to_f/1000).formated} #{unit}"
                end
              when :mass then
                if value < 2
                  "#{value} #{weight_units[:gr]}"
                elsif value < 1000
                  "#{value} #{pluralize weight_units[:gr]}"
                else
                  if value === 1000 || value < 2000
                    unit = weight_units[:kg]
                  else
                    unit = pluralize weight_units[:kg]
                  end
                  "#{(value.to_f/1000).formated} #{unit}"
                end
            end
          end

          def pluralize str
            "#{str}s"
          end

          def weight_units
            Decimal::Mass::PtBR.word_for_acronym.merge Decimal::Volume::PtBR
              .word_for_acronym
          end

      end

    end
  end
end

# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 1.1, :volume
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 2.1, :volume
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 2, :volume
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 0.9, :volume
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 0.91, :volume

# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 1.1, :mass
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 2.1, :mass
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 2, :mass
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 0.9, :mass
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 0.0012, :mass
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 0.002, :mass
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 0.0021, :mass
