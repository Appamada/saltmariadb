for i in `seq 10`;do
if `mysql -h{{ local_ip }} -e "exit"`;then
  LOG_FILE=`mysql -urepl_user -prepl_user -h{{ master_ip }} -e "show master status" | grep -v File | awk '{print $1}'`
  POS=`mysql -urepl_user -prepl_user -h{{ master_ip }} -e "show master status" | grep -v File | awk '{print $2}'`
  mysql -e "change master to MASTER_HOST='{{ master_ip }}',MASTER_PORT=3306,MASTER_USER='repl_user',MASTER_PASSWORD='repl_user',MASTER_LOG_FILE='$LOG_FILE',MASTER_LOG_POS=$POS;start slave;"
  touch /var/lib/mysql/mysql.lock
  exit

else
continue
  sleep 10
fi
echo 'cannot connecting mysql of master.'
done
