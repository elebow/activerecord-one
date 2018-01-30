module ActiveRecord
  # Raised when one record is expected but none are found
  class NoRecordFound < ActiveRecordError
  end

  # Raised when one record is expected but more than one is found
  class MultipleRecordsFound < ActiveRecordError
  end
end
