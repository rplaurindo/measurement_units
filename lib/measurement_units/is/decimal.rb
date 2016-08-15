lib = File.expand_path('../../../../lib/measurement_units', __FILE__)
$LOAD_PATH.unshift(lib)

require "extensions/float"

module MeasurementUnits
  module IS
    module Decimal

      extend self

      MULTIPLE = 10

      def to_units_before value, units, precision = nil
        value = value.to_f
        divisor = MULTIPLE ** units

        # value = (value / divisor).round(precision).to_f.formated
        if precision
          value = (value / divisor).round(precision).to_f.formated
        else
          value = (value / divisor).to_f.formated
        end
      end

      def to_units_after value, units, precision = nil
        value = value.to_f
        divisor = MULTIPLE ** units

        # value = (value < tester ? (value * tester).round : value).to_f.formated
        if precision
          value = (value * divisor).round(precision).to_f.formated
        else
          value = (value * divisor).to_f.formated
        end
      end

    end
  end
end

# kg     hg    dag  g dg cg  mg
# 0.0001 0.001 0.01 1 10 100 1000

# Examples

# l to ml
# p MeasurementUnits::IS::Decimal.to_units_after 1, 3

# # ml to l
# p MeasurementUnits::IS::Decimal.to_units_before 1200, 3
# # returns 1.2
# # Lê-se um litro e dois decilitros, ou vinte centilitros ou duzentos (concorda com a uniadde) mililitros (a milésima parte de um litro)
