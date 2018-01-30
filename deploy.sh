#!/bin/sh

IP=""

rsync -avzhI . "ec2-user@${IP}":~/c/

ssh "ec2-user@${IP}" "cd c; sh restart.sh"
