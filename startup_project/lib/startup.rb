require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = Array.new()
    end

    def valid_title?(title)
        salaries.has_key?(title)
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(name, title)
        unless self.valid_title?(title)
            raise ArgumentError.new "Invalid title"
        end
        #create new employee object with title and title's salary
        @employees << Employee.new(name, title)
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding >= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise ArgumentError.new "Insufficient funding."
        end
    end

    def payday
        @employees.each {|name|self.pay_employee(name)}
    end

    def average_salary
        total = @employees.inject(0) do |acc, employee|
            acc + @salaries[employee.title]
        end
        average = total / @employees.length
    end

    def close
        @employees = Array.new
        @funding = 0
    end

    def acquire(other_startup)
        #add other funding to self funding

        @funding += other_startup.funding
        #add other salaries (additionally) to self salaries

        other_startup.salaries.each do |title, salary|
            if @salaries.has_key?(title)
                #do nothing
            else
                @salaries[title] = salary
            end
        end

        #add other employees to self
        other_startup.employees.each do |employee|
            @employees << employee
        end

        #close other startup
        other_startup.close
    end

end
