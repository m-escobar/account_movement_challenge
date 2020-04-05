require 'csv'
require 'pry'

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

def initialize_accounts(account_file)
  account_file.each do |acc|
    @accounts[acc[0].to_i] =  acc[1].to_i
  end
end

def process_transactions
end

def print_balance
  puts "Your Account Balance: 00"
end

#==== Start from here =====
if ARGV.count != 2
  puts "Incorrect sintaxe - missing file names\nuse: account_movement account_file_name transactions_file_name"
  exit
else
  @error = []
  @accounts = {}

  open_file(ARGV[0], 'acc_file')
  open_file(ARGV[1], 'tsc_file')

  exit_with_errors if !@error.empty?

  account_file = CSV.parse(@acc_file, headers: ['id','value'])
  initialize_accounts(account_file)

  @transactions = CSV.parse(@tsc_file, headers: ['id','value'])

  process_transactions
  print_balance
end
