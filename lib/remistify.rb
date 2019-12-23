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
      # puts "total remiss = #{remiss}"
      # puts "issues per cycle = #{issues}"
      # puts "cycle = #{cycle}"
      # puts "seconds_per_cycle = #{seconds_per_cycle}"
      expiration = nil
      if from
         expiration = DateTime.parse(from).to_time
      else
         expiration = Time.now
         if tz
            expiration = expiration.in_time_zone(tz)
         end #/if
      end #/if-else

      if remiss < 1
         return expiration
      end #/if

      (1..remiss).each do |i|
         # puts "starting at #{expiration} and adding #{seconds_per_cycle} to that time...."
         # puts "#{i}: #{expiration}"
         expiration = expiration + seconds_per_cycle
         # puts "expiration = #{expiration}"
         # puts ""
      end #/each

      return expiration
   end #/def
end #/class