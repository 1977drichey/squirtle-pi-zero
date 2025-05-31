#!/bin/bash
#
# stream-launcher.sh
# Starts v4l2rtspserver on Pi Zero/Zero 2W at 640×480, 5 FPS, and logs output.
#

# Log file (you can change this path if you like)
LOGFILE="/var/log/stream-launcher.log"

# Device and parameters
VIDEO_DEVICE="/dev/video0"
WIDTH=640
HEIGHT=480
FRAMERATE=5
RTSP_PORT=8554
RTSP_PATH="live.sdp"

# Make sure the video device exists
if [ ! -e "$VIDEO_DEVICE" ]; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] Video device $VIDEO_DEVICE not found." | tee -a "$LOGFILE"
  exit 1
fi

# Check if v4l2rtspserver is installed or available
if ! command -v v4l2rtspserver >/dev/null 2>&1; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] v4l2rtspserver not found in PATH." | tee -a "$LOGFILE"
  exit 1
fi

# Launch v4l2rtspserver with the desired parameters
echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] Starting v4l2rtspserver on $VIDEO_DEVICE ($WIDTH×$HEIGHT @ ${FRAMERATE}fps)..." | tee -a "$LOGFILE"

# The -W and -H flags set width/height, -F sets FPS, -P sets RTSP port, -O sets SDP path
v4l2rtspserver \
  -W $WIDTH \
  -H $HEIGHT \
  -F $FRAMERATE \
  -P $RTSP_PORT \
  -O $RTSP_PATH \
  "$VIDEO_DEVICE" \
  >> "$LOGFILE" 2>&1 &

# Capture the PID so we can check or kill later if needed
PID=$!
echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] v4l2rtspserver started with PID $PID." | tee -a "$LOGFILE"

exit 0
