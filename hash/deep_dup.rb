class Hash
  def deep_dup
    duplicate = self.dup
    duplicate.each_pair do |k, v|
      tv = duplicate[k]
      duplicate[k] = tv.is_a?(Hash) && v.is_a?(Hash) ? tv.deep_dup : v
    end
    duplicate
  end
end

# Usage:
#
# hash = { :a => { :b => 'b' } }
# dup  = hash.deep_dup
# dup[:a][:c] = 'c'
# 
# puts hash[:a][:c] # => nil
# puts dup[:a][:c]  # => "c"
