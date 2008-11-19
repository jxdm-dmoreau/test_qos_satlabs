#!/bin/sh

WORKING_DIR=./data
SQL="SELECT value FROM datarate WHERE param_id='RBE' AND test_name='ST0' "

echo "Extract Data from MySQL..."
echo $SQL | mysql2gnuplot | ./kbps2atm > $WORKING_DIR/ST0_RBE.data 

SQL="SELECT value FROM datarate WHERE param_id='SBE' AND test_name='ST0' "
echo $SQL | mysql2gnuplot | ./kbps2atm > $WORKING_DIR/ST0_SBE.data 

SQL="SELECT value FROM datarate WHERE param_id='S' AND test_name='ST0' "
echo $SQL | mysql2gnuplot > $WORKING_DIR/ST0_S.data 

echo "Generate Graph..."
gnuplot < ST0.gpconf

echo "Preview Graph..."
eog ST0.png
