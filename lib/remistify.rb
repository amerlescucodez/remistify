require 'time_constants'
class Remistify
   # Calculates expiration based on remiss
   # @param remiss [integer] number of remaining issues to fulfill
   # @param issues [integer] issues per cycle
   # @param cycle [integer] integer value of time measurement for duration of subscription cycle (T_1_YEAR)
   # @param from [String] specify a starting point in time
   # @return [DateTime]
   def self.expiration(remiss, issues, cycle, from=nil, tz=nil)
      seconds_per_cycle = cycle.to_i / issues.to_i
      expiration = nil
      if from
         expiration = DateTime.parse(from).to_time
      else
         expiration = Time.now
         if tz
            expiration = expiration.in_time_zone(tz)
         end #/if
      end #/if-else

      range = (1..remiss)
      if remiss <= 0
         range = (remiss..-1) # ignore 0
      end#/if

      range.each do |i|
         if remiss >= 1
            expiration = expiration + seconds_per_cycle
         else
            expiration = expiration - seconds_per_cycle
         end #/if-else
      end #/each
      
      return expiration
   end #/def
end #/class