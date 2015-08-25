# Auto-screen invocation. see: http://taint.org/wk/RemoteLoginAutoScreen
# if we're coming from a remote SSH connection, in an interactive session
# then automatically put us into a screen(1) session.   Only try once
# -- if $STARTED_SCREEN is set, don't try it again, to avoid looping
# if screen fails for some reason.
if [ "$PS1" != "" -a "${STARTED_SCREEN:-x}" = x -a "${SSH_TTY:-x}" != x ]
then
  STARTED_SCREEN=1 ; export STARTED_SCREEN
  [ -d $HOME/.screen-logs ] || mkdir -p $HOME/.screen-logs
  sleep 1
  screen -x -R && exit 0
  # normally, execution of this rc script ends here...
  echo "Screen failed! continuing with normal bash startup"
fi
# [end of auto-screen snippet]