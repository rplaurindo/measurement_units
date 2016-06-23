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

        def weight_unit value, unit_type
          case unit_type.to_sym
            when :mass then
              if value <= 1
                weight_units[:gr]
              else
                if value < 1000
                  pluralize weight_units[:gr]
                elsif value === 1000 || value < 2000
                  weight_units[:kg]
                else
                  pluralize weight_units[:kg]
                end
              end
            when :volume then
              if value <= 1 || value < 1000
                "ml"
              else
                if value === 1000 || value < 2000
                  weight_units[:l]
                else
                  pluralize weight_units[:l]
                end
              end
          end
        end

        def humanize_for value, unit_type
          value = Decimal.to_units_before value, 3

          "#{Decimal.to_units_after value, 3} #{weight_unit value, unit_type}"
        end

        private
          def pluralize str
            "#{str}s"
          end

          def weight_units
            Decimal::Mass::PtBR.word_for_acronym.merge Decimal::Volume::PtBR.word_for_acronym
          end

      end

    end
  end
end

# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 1.100, :volume
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 2, :volume
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 2.1, :volume

# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 1.100, :mass
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 2, :mass
# p MeasurementUnits::IS::Decimal::PtBR.humanize_for 2.1, :mass
