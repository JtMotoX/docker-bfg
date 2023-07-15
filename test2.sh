#!/bin/sh

image_name="jtmotox/bfg"
image_tags="foo,bar"

images=$(echo "$image_tags" | sed "s,[^,]*,$image_name:&,g")

echo "$images"