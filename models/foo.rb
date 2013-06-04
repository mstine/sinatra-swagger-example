require 'json'

class Foo

  attr_accessor :bar, :baz

  def initialize(bar, baz)
    @bar = bar
    @baz = baz
  end

  def self.list
    results = []
    results << Foo.new(1, "a")
    results << Foo.new(2, "b")
    results << Foo.new(3, "c")
    results
  end

  def self.get(id)
    Foo.new(id, "baz-#{id}")
  end

  def to_json(*a)
    {
      'json_class' => self.class.name,
      'data' => [bar, baz]
    }.to_json(*a)
  end

end

