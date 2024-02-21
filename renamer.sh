STAGE_PATH=$1

rm -f $STAGE_PATH/*.lproj/InfoPlist.strings
rm -f $STAGE_PATH/Info.plist
rm -rf $STAGE_PATH/_CodeSignature
for f in $(find $STAGE_PATH -type f -name '*2.dat'); do rm -f "$f"; done
for f in $(find $STAGE_PATH -type f -name '*2.strings'); do rm -f "$f"; done
for f in $(find $STAGE_PATH -type f -name '*2.stringsdict'); do rm -f "$f"; done
for f in $(find $STAGE_PATH -type f -name '*2.plist'); do rm -f "$f"; done
for f in $(find $STAGE_PATH -type f -name '*.dat'); do mv "$f" "${f%.*}2.dat"; done
for f in $(find $STAGE_PATH -type f -name '*.strings'); do mv "$f" "${f%.*}2.strings"; done
for f in $(find $STAGE_PATH -type f -name '*.stringsdict'); do mv "$f" "${f%.*}2.stringsdict"; done
for f in $(find $STAGE_PATH -type f -name '*.plist'); do mv "$f" "${f%.*}2.plist"; done
