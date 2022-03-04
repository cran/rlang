# try_fetch() checks inputs

    Code
      (expect_error(try_fetch(NULL, function(...) NULL)))
    Output
      <error/rlang_error>
      Error in `try_fetch()`:
      ! `...` must be named with condition classes.

# can rethrow from `try_fetch()`

    Code
      err <- catch_error(try_fetch(f(), error = function(cnd) abort("bar", parent = cnd)))
      print(err)
    Output
      <error/rlang_error>
      Error:
      ! bar
      Caused by error in `h()`:
      ! foo
      ---
      Backtrace:
        1. rlang:::catch_error(...)
       15. rlang f()
       16. rlang g()
       17. rlang h()
    Code
      print(err, simplify = "none")
    Output
      <error/rlang_error>
      Error:
      ! bar
      Caused by error in `h()`:
      ! foo
      ---
      Backtrace:
           x
        1. +-rlang:::catch_error(...)
        2. | \-rlang::catch_cnd(expr, "error")
        3. |   +-rlang::eval_bare(...)
        4. |   +-base::tryCatch(...)
        5. |   | \-base tryCatchList(expr, classes, parentenv, handlers)
        6. |   |   \-base tryCatchOne(expr, names, parentenv, handlers[[1L]])
        7. |   |     \-base doTryCatch(return(expr), name, parentenv, handler)
        8. |   \-base::force(expr)
        9. +-rlang::try_fetch(f(), error = function(cnd) abort("bar", parent = cnd))
       10. | +-base::tryCatch(...)
       11. | | \-base tryCatchList(expr, classes, parentenv, handlers)
       12. | |   \-base tryCatchOne(expr, names, parentenv, handlers[[1L]])
       13. | |     \-base doTryCatch(return(expr), name, parentenv, handler)
       14. | \-base::withCallingHandlers(...)
       15. \-rlang f()
       16.   \-rlang g()
       17.     \-rlang h()
       18.       \-rlang::abort("foo")
    Code
      err <- catch_error(high1(chain = TRUE))
      print(err)
    Output
      <error/rlang_error>
      Error in `high3()`:
      ! bar
      Caused by error in `h()`:
      ! foo
      ---
      Backtrace:
        1. rlang:::catch_error(high1(chain = TRUE))
        9. rlang high1(chain = TRUE)
       10. rlang high2(...)
       11. rlang high3(...)
       18. rlang f()
       19. rlang g()
       20. rlang h()
    Code
      print(err, simplify = "none")
    Output
      <error/rlang_error>
      Error in `high3()`:
      ! bar
      Caused by error in `h()`:
      ! foo
      ---
      Backtrace:
           x
        1. +-rlang:::catch_error(high1(chain = TRUE))
        2. | \-rlang::catch_cnd(expr, "error")
        3. |   +-rlang::eval_bare(...)
        4. |   +-base::tryCatch(...)
        5. |   | \-base tryCatchList(expr, classes, parentenv, handlers)
        6. |   |   \-base tryCatchOne(expr, names, parentenv, handlers[[1L]])
        7. |   |     \-base doTryCatch(return(expr), name, parentenv, handler)
        8. |   \-base::force(expr)
        9. \-rlang high1(chain = TRUE)
       10.   \-rlang high2(...)
       11.     \-rlang high3(...)
       12.       +-rlang::try_fetch(f(), error = function(cnd) abort("bar", parent = cnd))
       13.       | +-base::tryCatch(...)
       14.       | | \-base tryCatchList(expr, classes, parentenv, handlers)
       15.       | |   \-base tryCatchOne(expr, names, parentenv, handlers[[1L]])
       16.       | |     \-base doTryCatch(return(expr), name, parentenv, handler)
       17.       | \-base::withCallingHandlers(...)
       18.       \-rlang f()
       19.         \-rlang g()
       20.           \-rlang h()
       21.             \-rlang::abort("foo")
    Code
      err <- catch_error(high1(chain = FALSE))
      print(err)
    Output
      <error/rlang_error>
      Error in `high3()`:
      ! bar
      ---
      Backtrace:
        1. rlang:::catch_error(high1(chain = FALSE))
        9. rlang high1(chain = FALSE)
       10. rlang high2(...)
       11. rlang high3(...)
       18. rlang f()
       19. rlang g()
       20. rlang h()
    Code
      print(err, simplify = "none")
    Output
      <error/rlang_error>
      Error in `high3()`:
      ! bar
      ---
      Backtrace:
           x
        1. +-rlang:::catch_error(high1(chain = FALSE))
        2. | \-rlang::catch_cnd(expr, "error")
        3. |   +-rlang::eval_bare(...)
        4. |   +-base::tryCatch(...)
        5. |   | \-base tryCatchList(expr, classes, parentenv, handlers)
        6. |   |   \-base tryCatchOne(expr, names, parentenv, handlers[[1L]])
        7. |   |     \-base doTryCatch(return(expr), name, parentenv, handler)
        8. |   \-base::force(expr)
        9. +-rlang high1(chain = FALSE)
       10. | \-rlang high2(...)
       11. |   \-rlang high3(...)
       12. |     +-rlang::try_fetch(f(), error = function(cnd) abort("bar", parent = NA))
       13. |     | +-base::tryCatch(...)
       14. |     | | \-base tryCatchList(expr, classes, parentenv, handlers)
       15. |     | |   \-base tryCatchOne(expr, names, parentenv, handlers[[1L]])
       16. |     | |     \-base doTryCatch(return(expr), name, parentenv, handler)
       17. |     | \-base::withCallingHandlers(...)
       18. |     \-rlang f()
       19. |       \-rlang g()
       20. |         \-rlang h()
       21. |           \-rlang::abort("foo")
       22. |             \-rlang:::signal_abort(cnd, .file)
       23. |               \-base::signalCondition(cnd)
       24. \-rlang `<fn>`(`<rlng_rrr>`)
       25.   \-handlers[[1L]](cnd)
       26.     \-rlang::abort("bar", parent = NA)
