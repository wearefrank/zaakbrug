if [ -d "$MOUNTED_PROJECT_DIR" ]; then
  cp -a $MOUNTED_PROJECT_DIR/. $PROJECT_DIR
fi

if [ -d "$MOUNTED_EXT_DIR" ]; then
  cp -a $MOUNTED_EXT_DIR/. $SOAPUI_DIR/bin/ext
fi

if [ -f "/tmp/soapui.properties" ]; then
  cp /tmp/soapui.properties $SOAPUI_DIR/bin/soapui.properties
  cp /tmp/soapui.properties $SOAPUI_DIR/lib/soapui.properties
  cp /tmp/soapui.properties $SOAPUI_DIR/soapui.properties
  cp /project/testrunner.sh $SOAPUI_DIR/bin/testrunner.sh
  echo "copied"
fi

echo "before execute"

sed -i "s|COMMAND_LINE|$COMMAND_LINE|" ./RunProject.sh
sed -i "s|%project%|$PROJECT_DIR|g" ./RunProject.sh
sed -i "s|%reports%|$REPORTS_DIR|g" ./RunProject.sh

./RunProject.sh

echo "After execute"
sleep 3600

export EXIT_CODE=$?

if [ $EXIT_CODE -eq 1 ]; then
    exit 102
fi

if [ $EXIT_CODE != 0 ]; then
    exit 103
fi

exit 0