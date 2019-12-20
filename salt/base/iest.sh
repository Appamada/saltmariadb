      for i in `seq 10`;do 
        if `mysql -h192.168.56.140 -e "exit"`;then
          echo "1" 
          exit
        else
          continue
          sleep 10
        fi
      done
