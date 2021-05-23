
require "byebug"
# EXERCISE 1
class Stack # the stack is an abstract data type
  def initialize
  @underlying_array = []
  end

  def push(el)
    @underlying_array.push(el)
  
  end

  def pop
    @underlying_array.pop
  end

  def peek
    @underlying_array.last
  end

  private

  attr_reader :underlying_array

end



# EXERCISE 2
class Queue
  def initialize
    @underlying_array = []
  end

  def enqueue(el)
    underlying_array.push(el)
    el
  end

  def dequeue
    underlying_array.shift
  end

  def peek
    underlying_array.first
  end

  private

  attr_reader :underlying_array
  
end



# EXERCISE 3
class Map # it takes in a key and value pair 
  def initialize
    @underlying_array = [] # when imeplwmtwntuing a ques stack or map algorithim there is an intial undserlying array 
  end

  def set(key, value)
    
    pair_index = @underlying_array.index { |pair| pair[0] == key } # we used .index becuase we want the pair index and the kety to be  the # [[3,4],[5,4]] # three and five is the key  # index with a abloc return teh index of the foirst object where the block return ret true#[3,6,8]
  if pair_index # this sis a true or fale condition 
      @underlying_array[pair_index][1] = value
    else
      @underlying_array.push([key, value])
    end
    value
  end

  def get(key)
    @underlying_array.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def delete(key)
    value = get(key)
    @underlying_array.reject! { |pair| pair[0] == key }
    value
  end

  def show
    deep_dup(underlying_array)
  end

  private

  attr_reader :underlying_array
  
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end  

end
