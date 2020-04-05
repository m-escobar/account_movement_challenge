require 'csv'

def open_file(origin, file_type)
  begin
    instance_variable_set('@' + file_type, File.read(origin))
  rescue
    @error << "Error - file #{origin} is empty."
  end
end

def exit_with_errors
  @error.each do |msg|
    puts msg
  end
  puts 'Exiting ...'
  exit
end


#==== Start from here =====
if ARGV.count != 2
  puts "Incorrect sintaxe - missing file names\nuse: account_movement account_file_name transactions_file_name"
  exit
else
  @error = []
  open_file(ARGV[0], 'acc_file')
  open_file(ARGV[1], 'tsc_file')

  exit_with_errors if !@error.empty?

  account_file = CSV.parse(@acc_file, headers: false)
  transaction_file = CSV.parse(@tsc_file, headers: false)

  puts account_file[0][1]
  puts "Your Account Balance: 00"
end
