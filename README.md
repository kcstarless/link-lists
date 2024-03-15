# Ruby: linked-lists

## Description
This project is to creates simplest form of dynamic data structure, linked-list. Linked list is not necessary in Ruby as arrays in ruby is not limited to size and both insertion and deletion can be achieved relatively easily with built in array method. However this will build solid foundation for other more complex data structure like graphs and binary tree. 

## Struture of a linked list
Linked list is a linear collection of data elements called <b><i>nodes</i></b> where each node holds data and a reference to the next node in the list. In order for linked list to work it will always need a `head`(first data) where it will read data from and a `tail` which is value of `nil` where the list ends. Basic structure of linked list is as follow:

[NODE(head)] -> [NODE] -> [NODE] -> [NODE(tail)] -> nil

Structure of node is as follow:
```
--------
- Data - 
--------
- NEXT -
--------  
```
Next will contain address of next Node in the list. Last entry will hold `nil` value to show it is end of the linked list. 


## Usage
To run the program enter `ruby linked_list.rb` in command prompt.

The #LinkedList class has following methods:
-   `#append(value)` adds a new node containing value to the end of the list
-   `#prepend(value)` adds a new node containing value to the start of the list
-   `#size` returns the total number of nodes in the list
-   `#head` returns the first node in the list
-   `#tail` returns the last node in the list
-   `#at(index)` returns the node at the given index
-   `#pop` removes the last element from the list
-   `#contains?(value)` returns true if the passed in value is in the list and otherwise      returns false.
-   `#find(value)` returns the index of the node containing value, or nil if not found.
-   `#to_s` represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format is: ( value ) -> ( value ) -> ( value ) -> nil.
-   `#insert_at(value, index)` that inserts a new node with the provided value at the given index.
-   `#remove_at(index)` that removes the node at the given index.

## Thought on the project
I had trouble understanding following block of code:

```ruby
  def tail(node = @head)
    return node if node.next_node.nil?

    tail(node.next_node)
  end

  def append(value)
    return @head = Node.new(value) if @head.nil?

    tail.next_node = Node.new(value)
  end
```

`tail.next_node` instead of assignment a variable to assignment it used a function call to return an object of node. 

I achieved `#remove_at` and `#pop` method by updating the `next_node` effectively skipping the node that needs to be removed. But does this approach remove the data from memory?
