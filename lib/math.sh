#!/bin/bash

function math.gt { # f1, f2
    [ 1 -eq $(echo "$1 > $2" | bc -l) ]
}

function math.percent { # f1, f2
   python3 - <<EOF
per = abs(($1/$2 - 1.0) * 100)
f = '{:.2f}'.format(per)
print(f)
EOF
}