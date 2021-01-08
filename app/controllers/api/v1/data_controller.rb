module Api::V1
  class DataController < ApplicationController
    def export
      ::Export.call(Customer)
      ::Export.call(Car)
      ::Export.call(Repair)
      ::Export.call(SparePart)
      ::Export.call(Payment)
    end

    def import
      ::Import.call(Customer)
      ::Import.call(Car)
      ::Import.call(Repair)
      ::Import.call(SparePart)
      ::Import.call(Payment)
    end
  end
end
