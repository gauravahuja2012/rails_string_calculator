class StringCalculator
  def self.add(numbers)
    # Strip quotes and unescape characters
    numbers = numbers.gsub(/^"|"$/, '').gsub('\\n', "\n")
    return 0 if numbers.empty?

    delimiter = determine_delimiter(numbers)
    numbers = remove_delimiter_prefix(numbers)
    split_numbers = numbers.split(/#{delimiter}/)
    raise_if_negative_numbers(split_numbers)
    sum = split_numbers.map(&:to_i).sum
    sum
  end

  private

  def self.determine_delimiter(numbers)
    if numbers.start_with?("//")
      custom_delimiter = numbers.match(%r{//(.+)\n})[1]
      Regexp.escape(custom_delimiter)
    else
      /[,\n]/
    end
  end

  def self.remove_delimiter_prefix(numbers)
    return numbers unless numbers.start_with?("//")
    numbers.split("\n", 2)[1]
  end

  def self.raise_if_negative_numbers(numbers)
    negatives = numbers.select { |n| n.to_i.negative? }
    unless negatives.empty?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end
  end
end