class Array
  def mode
    each_with_object(Hash.new(0)) do |el, acc|
      acc[el] += 1
    end.max_by { |_el, count| count }.first
  end
end
