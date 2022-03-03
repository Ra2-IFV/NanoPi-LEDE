#!/bin/bash

#Function Start

function Read_LEDE_Path ()
{
echo -e "Enter your LEDE dir name or path.(Leave blank if the script is just in it)"
read LEDE_PATH
#Check path,replace to $PWD if empty
if [ $LEDE_PATH = ]
then
LEDE_PATH=$PWD
fi
}

function Read_Target_Path ()
{
echo -e "Enter your target dir name or path.(Leave blank if the script is just in it)"
read TARGET_PATH
#Check path,replace to $PWD if empty
if [ $TARGET_PATH = ]
then
TARGET_PATH=$PWD
fi
}

#Function End

clear
echo -e "LEDE Multifunctional Script v1.0.0"
sleep 2s
echo -e "Enter a number."
echo -e "1. Clone LEDE(From Lean)"
echo -e "2. Clone LEDE(From Ra2-IFV)"
echo -e "3. Update LEDE"
echo -e "4. Pack and move your packages"
echo -e "5. Remove temporary file for rebuild"
echo -e "6. Exit"
read SELECT_OPTION

case $SELECT_OPTION in
1)
#Clone LEDE from Lean
git clone https://github.com/coolsnowwolf/lede
cd lede
echo -e "Done."
;;

2)
#Clone LEDE from Ra2-IFV
git clone https://github.com/Ra2-IFV/NanoPi-LEDE
cd NanoPi-LEDE
echo -e "Done."
;;

3)
#Update LEDE
Read_LEDE_Path
cd $LEDE_PATH && git pull
$LEDE_PATH/scripts/feeds update -a && ./scripts/feeds install -a
echo -e "Done."
;;

4)
#Pack and move your packages
Read_LEDE_Path
Read_Target_Path
mkdir $TARGET_PATH
tar zcvf $TARGET_PATH/Main.tar.gz $LEDE_PATH/bin/packages/*/*
tar zcvf $TARGET_PATH/Core.tar.gz $LEDE_PATH/bin/targets/*/*/packages
mv $LEDE_PATH/bin/targets/*/*/ $TARGET_PATH/
echo -e "Done."
;;

5)
#Remove temporary file for rebuild
echo -e "This option will remove all files under YOUR_LEDE_DIR/bin .Continue? (y/n)"
read OPTION_EXIT
if [ $OPTION_EXIT != 'y' ]
then
exit 0;
fi
Read_LEDE_Path
rm $LEDE_PATH/bin/* -rf
rm $LEDE_PATH/tmp -rf
echo -e "Done."
;;

6)
echo -e "Bye bye. :)"
;;

*)
echo -e "Unknown Argument."
exit 1
;;

esac
