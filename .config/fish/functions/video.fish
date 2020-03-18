function video -a cmd -a prop -d "~> Video recording"
    switch "$cmd"
        ##
        ## Record screen to file
        ##
        case "screen"
            set -l now (date "+%y-%m-%d__%H:%M:%S")
            set -l videoFile "$HOME/Videos/video-$now.mp4"
            set -l screenSize (xdpyinfo | grep dimensions | awk '{print $2;}')

            notify "~> video" "Recording screen. Saving to $videoFile"

            # params need to be in this order 
            ffmpeg \
              -f x11grab \
              -s $screenSize \
              -framerate 30 \
              -i $DISPLAY \
              -f alsa -i default \
              -vcodec h264 \
              -preset ultrafast \
              -tune zerolatency \
              $videoFile 

        ##
        ## Record webcam
        ##
        case "cam"
          set -l now (date "+%y-%m-%d__%H:%M:%S")
          set -l videoFile "$HOME/Videos/cam-$now.mkv"
          
          ffplay \
            -f v4l2 \
            -framerate 30 \
            -rtbufsize 64M \
            -video_size 320x240 \
            -i $prop 

        ##
        ## List all recordable devices
        ##
        case "ls"
          v4l2-ctl --list-devices

        ##
        ## Details about device
        ##
        case "info"
          ffmpeg -f v4l2 -list_formats all -i $prop

        case "*"
            notify "~> video" "command \"$cmd\" is invalid"
            return 1
    end
end
