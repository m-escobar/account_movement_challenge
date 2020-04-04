require 'csv'

if ARGV.count != 2
  puts "Incorrect sintaxe - missing file names\nuse: account_movement account_file_name transactions_file_name"
  exit
end
