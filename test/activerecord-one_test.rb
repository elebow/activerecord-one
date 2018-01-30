require 'test_helper'

class ActiveRecordOne
  class Test < ActiveSupport::TestCase
    def test_one_returns_single_result
      poodr = Book.find_by(title: "Practical Object-Oriented Design in Ruby")

      assert_nothing_raised do
        assert_equal poodr, Book.where(title: "Practical Object-Oriented Design in Ruby").one!
      end
    end

    def test_one_raises_exception_when_many_results
      assert_raises(ActiveRecord::MultipleRecordsFound) { Book.where.not(id: nil).one! }
    end

    def test_one_raises_exception_when_zero_results
      assert_raises(ActiveRecord::NoRecordFound) { Book.where(title: "Alice in Wonderland").one! }
    end
  end
end
