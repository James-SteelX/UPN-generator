require_relative 'generator'
require 'csv'
require 'csv-hash'

class Excel

# Read original csv, add pre generated UPNs.
  def fill_sheet(file)
    original = CSVHash(file)
    upns = create_upns(original[0].length)

    original[0].each_with_index do |row, i|
      row['upn'] = upns[i]
    end

    CSV.open(file, "wb") do |csv|
      csv << original[0][0].keys

      original[0].each do |hash|
        csv << hash.values
      end
    end
  end

# Create x amount of UPNs for csv.
  def create_upns(amount)
    Generator.new.generate_many(amount)
  end
end
