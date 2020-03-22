require 'time_constants'
class Remistify
   # Calculates expiration based on remiss
   # @param remiss [integer] number of remaining issues to fulfill
   # @param issues [integer] issues per cycle
   # @param cycle [integer] integer value of time measurement for duration of subscription cycle (T_1_YEAR)
   # @param from [String] specify a starting point in time
   # @return [DateTime]
   def self.expiration(remiss, issues, cycle, from=nil, tz=nil)
      # puts ""
      seconds_per_cycle = cycle.to_i / issues.to_i
      # puts "remiss = #{remiss}, issues = #{issues}, cycle = #{cycle}, from = #{from}, tz = #{tz}"
      expiration = nil
      if from
         expiration = DateTime.parse(from).to_time
      else
         expiration = Time.now
         if tz
            expiration = expiration.in_time_zone(tz)
         end #/if
      end #/if-else

      # if remiss < 1
      #    return expiration
      # end #/if

      range = (1..remiss)
      if remiss <= 0
         range = (remiss..-1) # ignore 0
      end
      range.each do |i|
         # puts "starting at #{expiration} and adding #{seconds_per_cycle} to that time...."
         # puts "#{i}: #{expiration}"
         if remiss >= 1
            expiration = expiration + seconds_per_cycle
         else
            expiration = expiration - seconds_per_cycle
         end #/if-else
         # puts "expiration = #{expiration}"
         # puts ""
      end #/each
      # puts "expiration = #{expiration&.strftime("%Y-%m-%d")}"
      # puts ""
      return expiration

   end #/def
end #/class