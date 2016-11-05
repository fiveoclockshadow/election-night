class Array
  def mode
    self.each_with_object(Hash.new(0)) do |el, acc|
      acc[el] += 1
    end.max_by { |el, count| count }.first
  end
end