#!/bin/bash

cd arceos/ || exit

rm pflash.img -f 
rm disk.img -f

make pflash_img
make disk_img

u1=false
u2=false
u3=false
u4=false
u5=false
u6=false
u61=false
u7=false
u8=false

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


make run A=tour/u_2_0 > a.txt 2>/dev/null
context=$(tail -n 2 ./a.txt )
# echo $context
if  [[ "$context" =~ "Hello, axalloc!" && "$context" =~ "[0, 1, 2, 3]" ]]; then
    echo "u2 passed"
    u2=true
else
    echo "u2 failed"  
fi

rm a.txt -f

make run A=tour/u_3_0 > a.txt 2>/dev/null
context=$(tail -n 2 ./a.txt )
# echo $context
if  [[ "$context" =~ "0xFFFFFFC022000000" && "$context" =~ "0x646C6670" && "$context" =~ "pfld" ]]; then
    echo "u3 passed"
    u3=true
else
    echo "u3 failed"  
fi

rm a.txt -f

make run A=tour/u_4_0 > a.txt 2>/dev/null
context=$(tail -n 1 ./a.txt )
# echo $context
if  [[ "$context" =~ "Multi-task OK!" ]]; then
    echo "u4 passed"
    u4=true
else
    echo "u4 failed"  
fi

rm a.txt -f


make run A=tour/u_5_0 > a.txt 2>/dev/null
context=$(tail -n 5 ./a.txt )
# echo $context
if  [[ "$context" =~ "worker1 ok!" && "$context" =~ "worker2 ok!" && "$context" =~ "Multi-task OK!" ]]; then
    echo "u5 passed"
    u5=true
else
    echo "u5 failed"  
fi

rm a.txt -f

make run A=tour/u_6_0 > a.txt 2>/dev/null
context=$(tail -n 5 ./a.txt )
#vecho $context
if  [[ "$context" =~ "Multi-task(Preemptible) ok!" ]]; then
    echo "u6 passed"
    u6=true
else
    echo "u6 failed"  
fi

rm a.txt -f

make run A=tour/u_6_1 > a.txt 2>/dev/null
context=$(tail -n 5 ./a.txt )
#vecho $context
if  [[ "$context" =~ "WaitQ ok!" ]]; then
    echo "u61 passed"
    u61=true
else
    echo "u61 failed"  
fi

rm a.txt -f

make run A=tour/u_7_0 BLK=y > a.txt 2>/dev/null
context=$(tail -n 1 ./a.txt )
#vecho $context
if  [[ "$context" =~ "Load app from disk ok!" ]]; then
    echo "u7 passed"
    u7=true
else
    echo "u7 failed"  
fi

rm a.txt -f

make run A=tour/u_8_0 BLK=y > a.txt 2>/dev/null
context=$(tail -n 5 ./a.txt )
#vecho $context
if  [[ "$context" =~ "Load app from disk ok!" && "$context" =~ "worker1 ok!" ]]; then
    echo "u8 passed"
    u8=true
else
    echo "u8 failed"  
fi

rm a.txt -f

if [[ "$u1" == true && "$u2" == true  && "$u3" == true  && "$u4" == true  && "$u5" == true && "$u6" == true && "$u61" == true && "$u7" == true && "$u8" == true ]]; then
    echo "tours passed"
    exit 0
else
    echo "tours failed"
    exit 1
fi