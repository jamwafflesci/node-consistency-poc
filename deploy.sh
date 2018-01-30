#!/bin/sh

IP=""

rsync -avzh . "ec2-user@${IP}":~/c/

ssh "ec2-user@${IP}" "cd c; sh restart.sh"
