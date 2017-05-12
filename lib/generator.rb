class Generator

  LETTERS = {
    0 => 'A', 1 => 'B', 2 => 'C', 3 => 'D', 4 => 'E', 5 => 'F', 6 => 'G',
    7 => 'H', 8 => 'J', 9 => 'K', 10 => 'L',11 => 'M',12 => 'N',13 => 'P',
    14 => 'Q',15 => 'R',16 => 'T',17 => 'U',18 => 'V',19 => 'W',20 => 'X',
    21 => 'Y',22 => 'Z'
  }

# Validate a UPN is correct.
  def validate(upn)
    array = upn.split(//)
    firstCharacter = array.slice!(0)

    if LETTERS.has_value?(firstCharacter) && array.length == 12
      total = array.map.with_index{ |element, index| element.to_i * (index + 2)}
      key = total.inject(:+).to_f % 23

      LETTERS[key.floor] == firstCharacter
    else
      false
    end
  end

# Generate a valid UPN.
  def generate
    array = Array.new(12) { rand(1...9) }
    totals = array.map.with_index{ |element, index| element.to_i * (index + 2)}
    key = totals.inject(:+).to_f % 23.0

    upn = array.unshift(LETTERS[key.floor])

    upn.join('')
  end

# Generate x amount of valid UPNs.
  def generate_many(amount = 1)
    upns = []
    $i = 0

    while $i < amount do
      upn = generate

      if upns.include?(upn) || !validate(upn)
        redo
      end

      upns.push(upn)

      $i += 1
    end

   upns
  end
end
