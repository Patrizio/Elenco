namespace :db do
  desc "load user data from csv"
  task :load_csv  => :environment do
    require 'csv'
    
    CSV.foreach("lib/tasks/saatchi.csv",{ :headers => true, :col_sep => ","}) do |row|
      Employee.create(
      		:extension => row[0],
      		:firstname => row[1],
      		#:prepostion => row[2], 
      		:lastname => row[3], 
      		:email => row[4],
      		:company_id => 1,
      		:created_at => Time.now, 
      		:updated_at => Time.now)
    end
    
  end
end