#!/bin/bash

find . -type f -exec sed -i '' "s/co.daresay.kmmtemplate/$1/g" {} +

exit 0
