module Jekyll
  module ToolsFilter
	def enumerate(input, property=nil)
	    get_property = lambda do |item|
	    	if property
				property.split('.').each do |p|
					item = item[p]
				end
	    	end
	    	return item
	    end
		output = ""
		i=input.length
		input.each do |index, item|
			output += get_property.call(item).to_s
			output += ' and ' if i == 2
			output += ', ' if i > 2
			i -= 1
		end
		return output
	end
  end
end

Liquid::Template.register_filter(Jekyll::ToolsFilter)