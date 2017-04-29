def print_self
  selfy = File.open("print_self.rb", "r")
    selfy.readlines.each do |line|
      print line
    end
  end

print_self
