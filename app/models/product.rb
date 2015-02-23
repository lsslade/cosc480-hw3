class Product < ActiveRecord::Base
    def age_range ()
        min = self.minimum_age_appropriate
        max = self.maximum_age_appropriate
        print min
        print max
        if min == nil #if min not set we know max cannot be set
            return "0 and above"
        elsif min == max
            return "Age #{min.to_s}"
        elsif max == nil #only minum age
            return "#{min.to_s} and above"
        else 
            return  "#{min.to_s} to #{max.to_s}"
        end
    end
    
    def age_appropriate?(age)
        min = self.minimum_age_appropriate
        max = self.maximum_age_appropriate
        if min == nil #min not set. appropriate
            return true 
        elsif age < min #age <min. not appropriate
            return  false
        elsif max == nil
            return true # max not set. can't be too old
        elsif age > max 
            return false
        end
        return appropriate
    end

    def sorted_by(field)
        if Product.column_names.include?(field)
            return Product.order(field)
        end
    end


end
