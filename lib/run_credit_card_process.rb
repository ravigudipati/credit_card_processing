require './card'
require './card_processor'

# This code runs on commandline with the input
processor = CardProcessor.new

# Read from commandline
if ARGV.empty?
  $stdin.each_line do|line|
    processor.process_cards(line)
  end
else
  file_name = ARGV.first
  if File.exists?(file_name)
    File.open(file_name, 'r') do|file|
      file.each_line do|line|
        processor.process_cards(line)
      end
    end
  else
    puts "File not found"
  end
end

processor.generate_report
