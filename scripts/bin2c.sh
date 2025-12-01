#!/bin/bash

# Usage: ./bin2c.sh input.bin output.h array_name

if [ $# -ne 3 ]; then
    echo "Usage: $0 <input.bin> <output.h> <array_name>"
    exit 1
fi

INPUT=$1
OUTPUT=$2
ARRAY_NAME=$3

# Get file size
SIZE=$(stat -c%s "$INPUT")

echo "#ifndef _${ARRAY_NAME^^}_H_" > "$OUTPUT"
echo "#define _${ARRAY_NAME^^}_H_" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "// Generated from $INPUT" >> "$OUTPUT"
echo "const unsigned char $ARRAY_NAME[] = {" >> "$OUTPUT"

od -v -t x1 "$INPUT" | awk '
BEGIN { first = 1 }
{
    for (i = 2; i <= NF; i++) {
        if (first) {
            printf "    0x%s", $i
            first = 0
        } else {
            printf ", 0x%s", $i
        }
    }
    printf "\n"
}
' >> "$OUTPUT"

echo "};" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "const unsigned int ${ARRAY_NAME}_len = $SIZE;" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "#endif // !_${ARRAY_NAME^^}_H_" >> "$OUTPUT"