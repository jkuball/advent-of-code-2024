IN=$(</dev/stdin)

L1=$(echo "$IN" | cut -d\  -f1)
L2=$(echo "$IN" | cut -d\  -f4)

WC2=$(echo "$L2" | sort | uniq -c)

SCORE=0
while read -r number
do
  if echo "$L2" | grep -q "$number" > /dev/null
  then
    MATCH2=$(echo "$WC2" | grep "[[:digit:]][[:digit:]]* $number" || true)

    # shellcheck disable=SC2086,SC2001
    OCCURRENCE=$(echo $MATCH2 | cut -d\  -f1)

    (( SCORE += number * OCCURRENCE ))
  fi
done < <(echo "$L1")

echo "$SCORE"
