class Array
  def my_inject(init = nil, symb = nil)
    if symb == nil && init != nil && init.class != Symbol
      m = init
	  self.each{ |n|
	    m = yield(m,n)
	  }
	elsif symb != nil && init != nil && init.class != Symbol
	  m = init 
	  self.each{ |n|
	    m = m.send( symb, n)
	  }
	elsif symb == nil && init != nil && init.class == Symbol
	  m = self.first
	  self.each{ |n|
	    m = m.send( init, n)
	  }	
    elsif symb == nil && init == nil 	
      m = self.first
	  self.each{ |n|
	    m = yield(m,n)
	  }	  
	end
    m
  end
end

[1,2,3].my_inject(0,:+)
[1,2,3].my_inject(0){|s,n| s + n}
[1,2,3].my_inject{|s,n| s + n}
[1,2,3].my_inject(:+)

[1,2,3].my_inject(1,:*)
[1,2,3].my_inject(1){|s,n| s * n}
[1,2,3].my_inject{|s,n| s * n}
[1,2,3].my_inject(:*)
