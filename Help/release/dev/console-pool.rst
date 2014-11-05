console-pool
------------

* A USES_TERMINAL flag has been added to the add_custom_command and
  add_custom_target commands. The flag gives the command direct access to
  the terminal if possible. With the Ninja generator, it places the command
  in the console pool.
