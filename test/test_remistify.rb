require 'minitest/autorun'
require 'remistify'
require 'time_constants'
require 'date'

class RemistifyTest < Minitest::Test
  def test_two_years_six_issues_per_year
    #                                 remiss, issues_per_cycle, cycle_length, from
    expiration = Remistify.expiration 12,     6,                T_1_YEAR,     "2019-12-21"
    assert_equal "2021-12-20", expiration.strftime("%Y-%m-%d")
  end #/def

  def test_twenty_remiss_with_eight_issues_per_year
    #                                 remiss, issues_per_cycle, cycle_length, from
    expiration = Remistify.expiration 20,     8,                T_1_YEAR,     "2020-02-26"
    assert_equal "2022-08-27", expiration.strftime("%Y-%m-%d")
  end #/def

  def test_one_week_subscriptions_with_daily_remiss
    #                                 remiss, issues_per_cycle, cycle_length, from
    expiration = Remistify.expiration 7,      7,                T_1_WEEK,     "2020-02-26"
    assert_equal "2020-03-04", expiration.strftime("%Y-%m-%d")
  end #/def

  def test_one_year_twelve_issues_per_year
    #                                 remiss, issues_per_cycle, cycle_length, from
    expiration = Remistify.expiration 12,     12,               T_1_YEAR,     "2019-12-21"
    assert_equal "2020-12-20", expiration.strftime("%Y-%m-%d")
  end #/def

  def test_one_year_fifty_two_issues_per_year
    #                                 remiss, issues_per_cycle, cycle_length, from
    expiration = Remistify.expiration 52,     52,               T_1_YEAR,     "2019-12-21"
    assert_equal "2020-12-20", expiration.strftime("%Y-%m-%d")
  end #/def
  
  def test_no_remaining_remiss
    #                                 remiss, issues_per_cycle, cycle_length, from
    expiration = Remistify.expiration 0,      52,               T_1_YEAR,     "2019-12-21"
    assert_equal "2019-12-21", expiration.strftime("%Y-%m-%d")
  end #/def

  def test_negative_remiss
    #                                 remiss, issues_per_cycle, cycle_length, from
    expiration = Remistify.expiration -1,     52,               T_1_YEAR,     "2019-12-21"
    assert_equal "2019-12-21", expiration.strftime("%Y-%m-%d")
  end
end #/class