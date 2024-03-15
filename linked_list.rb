# 12/03/24
# Project: Linked-List
# Assignment

### LinkedList contains a head and node
class LinkedList
  def initialize
    @head = nil
  end

  def tail(node = @head)
    return node if node.next_node.nil?

    tail(node.next_node)
  end

  def append(value)
    return @head = Node.new(value) if @head.nil?

    tail.next_node = Node.new(value)
  end

  def prepend(value)
    append(value) if @head.nil?

    node = @head
    @head = Node.new(value)
    @head.next_node = node
  end

  def size
    return 0 if @head.nil?

    node = @head
    count = 1
    until node.next_node.nil?
      node = node.next_node
      count += 1
    end
    count
  end

  def first
    return nil if @head.nil?

    @head
  end

  def last
    node = @head
    node = node.next_node until node.next_node.nil?
    node
  end

  def at(index, node = @head, count = 0)
    return `Index out of bound` if index >= size || index.negative?
    return node if count == index

    at(index, node.next_node, count + 1)
  end

  def pop(node = @head)
    return nil if head.nil?
    return node.next_node = nil if node.next_node.next_node.nil?

    pop(node.next_node)
  end

  def contains?(value, node = @head)
    return true if node.value == value
    return false if node.next_node.nil?

    contains?(value, node.next_node)
  end

  def find(value, node = @head, count = 0)
    return count if node.value == value
    return nil if node.next_node.nil?

    find(value, node.next_node, count + 1)
  end

  def to_s(node = @head, list = '')
    return nil if @head.nil?
    return list + "(#{node.value}) -> nil" if node.next_node.nil?

    to_s(node.next_node, list + "(#{node.value}) -> ")
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?

    node = Node.new(value)
    node.next_node = at(index)
    at(index - 1).next_node = node
  end

  def remove_at(index)
    return 'Index is out of range!' if index >= size || index.negative?

    removed_node = at(index)

    if index.zero?
      @head = at(1)
      return removed_node
    end

    at(index - 1).next_node = nil if index == size - 1
    at(index - 1).next_node = at(index + 1)

    removed_node
  end
end

### A Node contains value and next node
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# Test
new_list = LinkedList.new
new_list.append(5)
new_list.append(10)
new_list.append(20)
new_list.append(40)
new_list.prepend(4)
new_list.prepend(3)
new_list.insert_at(60, 2)
new_list.remove_at(3)
# puts new_list.last.value
puts new_list
