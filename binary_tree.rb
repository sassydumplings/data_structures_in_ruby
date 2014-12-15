#! /usr/bin/ruby

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

# need to write deletion and minitest tests