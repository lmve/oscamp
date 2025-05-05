#!/bin/bash

cd arceos/ || exit

rm pflash.img -f 
rm disk.img -f

make pflash_img
make disk_img

u1=false

make run A=tour/u_1_0 > a.txt 2>/dev/null
context=$(tail -n 1 ./a.txt )
# echo $context
if  [[ "$context" =~ "Hello, Arceos!" ]]; then
    echo "u1 passed"
    u1=true
else
    echo "u1 failed"  
fi

rm a.txt -f

if [[ "$u1" == true ]]; then
    echo "tours passed"
    exit 0
else
    echo "tours failed"
    exit 1
fi