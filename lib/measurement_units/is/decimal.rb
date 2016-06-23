lib = File.expand_path('../../../../lib/measurement_units', __FILE__)
$LOAD_PATH.unshift(lib)

require "extensions/float"

module MeasurementUnits
  module IS
    module Decimal

      extend self

      MULTIPLE = 10

      def to_units_before value, units
        value = value.to_f
        tester = MULTIPLE ** units
        value = (value < tester ? (value * tester).round : value).to_f.formated
      end

      def to_units_after value, units
        value = value.to_f
        tester = MULTIPLE ** units
        value = (value >= tester ? value / tester : value).to_f.formated
      end

    end
  end
end

# # kg to gr, for example
# p MeasurementUnits::IS::Decimal.to_units_before 0.001, 3
# p MeasurementUnits::IS::Decimal.to_units_before 0.01, 3
# p MeasurementUnits::IS::Decimal.to_units_before 0.1, 3
# p MeasurementUnits::IS::Decimal.to_units_before 1, 3
# p MeasurementUnits::IS::Decimal.to_units_before 1.001, 3
# p MeasurementUnits::IS::Decimal.to_units_before 1.010, 3
# p MeasurementUnits::IS::Decimal.to_units_before 1.100, 3

# # gr to kg, for example
# p MeasurementUnits::IS::Decimal.to_units_after 999, 3
# p MeasurementUnits::IS::Decimal.to_units_after 1000, 3
# p MeasurementUnits::IS::Decimal.to_units_after 1001, 3
# p MeasurementUnits::IS::Decimal.to_units_after 1010, 3
# p MeasurementUnits::IS::Decimal.to_units_after 1100, 3
