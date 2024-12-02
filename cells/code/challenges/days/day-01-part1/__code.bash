IN=$(</dev/stdin)

L1=$(echo "$IN" | cut -d\  -f1 | sort)
L2=$(echo "$IN" | cut -d\  -f4 | sort)

WEAVED=$(paste -d '\n' <(echo "$L1") <(echo "$L2"))
JOINED=$(paste -d "-" - - < <(echo "$WEAVED"))
MATHED=$(xargs printf "echo \$(( %s ))\n" < <(echo "$JOINED"))
ABSED=$(eval "$MATHED" | sed 's/^-//')

SUM=0
while read -r line
do
  (( SUM += line ))
done < <(echo "$ABSED")

echo $SUM
