#!/bin/bash

image_name="jtmotox/bfg"
image_tags="foo,bar"

IFS=','  # Set the input field separator to comma
set -- $image_tags  # Split the string into positional parameters
images=""
for item do
    images="$images$image_name:$item,"
done
images=${images%,}  # Remove the trailing comma
echo "$images"