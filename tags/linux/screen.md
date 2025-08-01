screen: launch multiple shell sessions

Operations:
  Create new session
      screen -S session_name

  Resume detached session
      screen -r session_name

  List screen sessions
      screen -ls

Keybindings:
  Ctrl+a d  - Detach from session; reuse later
  Ctrl+a c  - Create a new window (with shell)
  Ctrl+a "  - List all windows
  Ctrl+a 0  - Switch to window 0 (by number)
  Ctrl+a A  - Rename the current window
  Ctrl+a S  - Split current region horizontally into two regions
  Ctrl+a |  - Split current region vertically into two regions
  Ctrl+a Q  - Close all regions but the current one
  Ctrl+a X  - Close the current region
  Ctrl+a Tab     - Switch the input focus to the next region
  Ctrl+a Ctrl+a  - Toggle between the current and previous windows
