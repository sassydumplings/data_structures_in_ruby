#! /usr/bin/ruby
gem 'minitest'
require 'minitest/autorun'

class Node
     attr_accessor :left, :right, :data

     def insertion data
      if self.data.nil?
        self.data = data
        return
      end
      test = data <=> self.data
       if test < 0
          @left = Node.new if self.left.nil?
          @left.insertion data
       elsif  test > 0
           @right = Node.new if self.right.nil?
           @right.insertion data
       end
     end

     def search data
       test = data <=> self.data
       if test == 0
         return self
       elsif test < 0
         return self.left.search data unless self.left.nil?
       elsif test > 0
         return self.right.search data unless self.right.nil?
       end
        return nil
     end

end

describe Node do
  let :node do
   Node.new
  end

  describe "#insertion" do
    it "should insert a node at root" do
      node.insertion 2
      (node.data).must_equal 2
    end
    it "should a lesser node to the left" do
       node.insertion 6
       node.insertion 2
       (node.left.data ).must_equal 2
    end
    it "should a greater node to the right" do
       node.insertion 6
       node.insertion 8
       (node.right.data).must_equal 8
    end
  end

  describe "#search" do
    it "should find node of value" do
      node.insertion 6
      node.insertion 2
      node.insertion 8
      node.insertion 3
      node.search(3).must_equal node.left.right
    end
  end
end

