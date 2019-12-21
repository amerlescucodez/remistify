# Remistify 
Calculate expiration of a given remiss data set.

```ruby
Remistify.expiration(remiss, cadence, unit, from=DateTime.now)
```

Example usage: 

```ruby
Remistify.expiration(600, 6, T_1_MONTH)
Remistify.expiration(600, 26, T_2_WEEKS, "2020-01-01")
```