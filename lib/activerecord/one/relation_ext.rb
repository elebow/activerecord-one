class ActiveRecord::Relation
  # Asserts that the collection contains exactly one record, and returns it.
  #
  # If the collection is empty, it raises <tt>ActiveRecord::NoRecordFound</tt>.
  # If the collection contains more than one record, it raises
  # <tt>ActiveRecord::MultipleRecordsFound</tt>.
  def one!
    case size
    when 0
      raise ActiveRecord::NoRecordFound
    when 1
      first
    else
      raise ActiveRecord::MultipleRecordsFound
    end
  end
end
