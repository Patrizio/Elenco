namespace :db do
  desc "load user data from csv"
  task :load_csv  => :environment do
   
    require "csv"
    
    CSV.foreach("db/saatchi-employees.csv", 
    				:headers           => true,
                  	:header_converters => :symbol,
                  	:col_sep => ',' ) do |row|
    	Employee.create(
        	:extension => row[0],
        	:firstname => row[1],
        	:preposition => row[2],
        	:lastname => row[3],
        	:email => row[4],
        	:company_id => 1
      	)    
    end
    
  end
end
