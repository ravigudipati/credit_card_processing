require 'card'
require 'card_processor'

processor = CardProcessor.new

# Read from commandline
if ARGV.empty?
  $stdin.each_line do|line|
    processor.process_cards(line)
  end
else
  file_name = ARGV.first
  File.open(file_name, 'r') do|file|
    file.each_line do|line|
      processor.process_cards(line)
    end
  end
end

processor.generate_report
