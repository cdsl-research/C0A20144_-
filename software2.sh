function backup () {
watch=(-e CREATE -e CLOSE_WRITE -m)
inotifywait ${watch[@]} /home/mikami/10test | while read notice
do
if [ "`echo $notice | awk "{print \$2;}" | grep CLOSE_WRITE`" ]
then
    fdupes -frdN /home/mikami/test
fi
done
}

backup &