module BusinessTime

  class BusinessDays
    def initialize(days)
      @days = days
    end

    def after(time = Time.now)
      time = Time.zone.parse(time.to_s)
      @days.times do
        begin
          time = time + 1.day
        end until time.workday?
      end
      time
    end
    
    alias_method :from_now, :after
    alias_method :since, :after
    
    def before(time = Time.now)
      time = Time.zone.parse(time.to_s)
      @days.times do
        begin
          time = time - 1.day
        end until time.workday?
      end
      time
    end
    
    alias_method :ago, :before
    alias_method :until, :before
  
  end  
  
end
