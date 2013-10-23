# Load the rails application
require File.expand_path('../application', __FILE__)

class Hash
  def recursive_find_by_key(key)
    # Create a stack of hashes to search through for the needle which
    # is initially this hash
    stack = [ self ]
    result = []

    # So long as there are more haystacks to search...
    while (to_search = stack.pop)
      # ...keep searching for this particular key...
      to_search.each do |k, v|
        # ...and return the corresponding value if it is found.
        result << v if (k == key)

        # If this value can be recursively searched...
        if (v.kind_of? Array)
          v.each do |el|
            if (el.respond_to?(:recursive_find_by_key))
              # ...push that on to the list of places to search.
              stack << el
            end
          end
        end
        
        if (v.respond_to?(:recursive_find_by_key))
          # ...push that on to the list of places to search.
          stack << v
        end
      end
    end
    return result
  end
end

# Initialize the rails application
Ixsellapp::Application.initialize!
