#!/bin/bash

find . -type f -exec perl -pi -e "s/co.daresay.kmmtemplate/$1/g" {} +

exit 0
