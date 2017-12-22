# frozen_string_literal: true

class User
  attr_accessor :fname, :lname, :age, :is_old, :currency, :money, :options

  EMAIL = 'mail@example.com'

  def initialize(fname, lname, age)
    self.age = age
    self.fname = fname
    self.lname = lname

    self.is_old = yield age
  end

  def full_name
    name = "#{fname} #{lname}"
    name.strip.empty? ? EMAIL : name
  end

  def report
    "#{full_name} has #{money * currency} money and he is #{'not ' unless reach?}reach "
  end

  def reach?
    return true if options[:has_villa] || options[:has_mercedes] || options[:is_reach]

    money * currency > 1000
  end
end

