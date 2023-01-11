function backup () {
watch=(-e CREATE -e CLOSE_WRITE -m)
inotifywait ${watch[@]} /home/mikami/10test | while read notice
do
if [ "`echo $notice | awk "{print \$2;}" | grep CREATE`" ]
then
    killall -SIGSTOP fdupes
else
    time scp /home/mikami/10test/test-10gb-send.mov mikami@192.168.100.211:/home/mikami/test
fi
done
}

backup &
