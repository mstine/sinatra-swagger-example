require 'json'

class Bar

  attr_accessor :foo, :baz

  def initialize(foo, baz)
    @foo = foo
    @baz = baz
  end

  def self.list
    results = []
    results << Bar.new(1, "x")
    results << Bar.new(2, "y")
    results << Bar.new(3, "z")
    results
  end

  def self.get(id)
    Bar.new(id, "baz-#{id}")
  end

  def to_json(*a)
    {
      'json_class' => self.class.name,
      'data' => [foo, baz]
    }.to_json(*a)
  end

end

