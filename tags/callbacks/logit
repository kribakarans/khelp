Logit callback model:

Caller:
  retval = init_logit(logfile, "w", LOGIT_DEBUG, LOGIT_SET_COMP, LOGIT_SET_CONSOLE, logit_cb);

Callback:
  int logit_cb(void)
  {
    logit_printf("user callback called !!!");
    return 0;
  }

Prototype:
  int init_logit(const char *logfile, const char *mode, const int level, int flags, const int console, int (*attr)(void));

Definition:
  int init_logit(const char *logfile, const char *mode, const int level, int flags, const int console, int (*attr)(void))
  {
    if (attr != NULL) {
      /* Calling callback */
      retval = attr();
    }

    return retval;
  }
