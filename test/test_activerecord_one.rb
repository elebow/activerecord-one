# frozen_string_literal: true

require "active_record"
require "minitest/autorun"

require "./lib/activerecord/one"

class Book < ActiveRecord::Base
end

class TestActiveRecordOne < Minitest::Test
  def setup
    ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

    ActiveRecord::Schema.define do
      create_table :books do |t|
        t.string :title
        t.string :author_name
      end
    end

    Book.create!(title: "Practical Object-Oriented Design in Ruby",
                 author_name: "Sandi Metz")
    Book.create!(title: "Clean Code: A Handbook of Agile Software Craftsmanship",
                 author_name: "Robert C. Martin")
    Book.create!(title: "Confident Ruby", author_name: "Avdi Grimm")
  end

  def test_one_returns_single_result
    poodr = Book.find_by(title: "Practical Object-Oriented Design in Ruby")

    # implied assertion that no exceptions are raised
    assert_equal poodr, Book.where(title: "Practical Object-Oriented Design in Ruby").one!
  end

  def test_one_raises_exception_when_many_results
    assert_raises(ActiveRecord::MultipleRecordsFound) { Book.where.not(id: nil).one! }
  end

  def test_one_raises_exception_when_zero_results
    assert_raises(ActiveRecord::NoRecordFound) { Book.where(title: "Alice in Wonderland").one! }
  end
end
