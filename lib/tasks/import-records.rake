namespace :db do
  desc "load user data from csv"
  task :load_csv_data  => :environment do
    require 'csv'
    
    CSV.foreach("lib/tasks/employees.csv",{ :col_sep => ";"}) do |row|
      Employee.create(:firstname => row[0], :lastname => row[1], :title => row[2], :department => row[3], 
      :extension => row[4], :mobile => row[5], :created_at => Time.now, :updated_at => Time.now)
    end
    
  end
end