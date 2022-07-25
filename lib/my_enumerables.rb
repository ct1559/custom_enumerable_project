module Enumerable
  # Your code goes here
  def my_each_with_index
    unless block_given?
      puts 'No block given'
      return
    end
    index = 0
    for element in self do
      yield element, index
      index += 1
    end
  end

  def my_select
    unless block_given?
      puts 'No block given'
      return
    end

    results = []
    my_each { |element| results << element if yield element }
    results
  end

  def my_all?
    unless block_given?
      puts 'No block given'
      return
    end

    my_each do |element| 
      unless yield element
        return false
      end
    end
    true
  end

  def my_any?
    unless block_given?
      puts 'no block given'
      return
    end

    my_each do |element|
      if yield element
        return true
      end
    end
    false
  end

  def my_none?
    unless block_given?
      puts 'No block given'
      return
    end

    my_each do |element|
      if yield element
        return false
      end
    end
    true
  end

  def my_count
    unless block_given?
      return self.length
    end
    count = 0
    my_each { |element| count += 1 if yield element }
    count
  end

  def my_map
    unless block_given?
      puts 'No block given'
      return
    end

    results = []
    my_each { |element| results << yield(element) }
    results
  end

  def my_inject(num)
    unless block_given?
      puts 'No block given'
      return
    end

    my_each do |element|
      num = yield num, element
    end
    num
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    unless block_given?
      puts 'No block given'
      return
    end
    for element in self do
      yield element
    end
  end
end
