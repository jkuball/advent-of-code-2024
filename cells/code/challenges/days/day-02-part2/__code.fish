function is_safe
  set is_decreasing 0
  set is_increasing 0

  set parts (string split ' ' $argv)

  set last $parts[1]
  for current in $parts[2..-1]
    # distance check
    set distance (math "abs($last - $current)")
    if test $distance -gt 3; return -1; end
    if test $distance -lt 1; return -1; end

    # decrease check
    if test $current -gt $last; set is_increasing 1; end
    if test $current -lt $last; set is_decreasing 1; end
    if test (math $is_decreasing + $is_increasing) -gt 1
      return -1
    end

    set last $current
  end

  return 0
end

function dampener
  set parts (string split ' ' $argv)

  for i in (seq (count $parts))
    set copy $parts
    set -e copy[$i]
    if is_safe (string join ' ' $copy)
      return 0
    end
  end
  return -1
end

set num_safe 0
while read line
  if is_safe $line
    set num_safe (math $num_safe + 1)
  else
    if dampener $line
      set num_safe (math $num_safe + 1)
    end
  end
end

echo $num_safe
