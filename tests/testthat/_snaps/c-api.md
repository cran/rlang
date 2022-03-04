# internal error is thrown with OOB dyn-lof access

    Code
      err(lof_arr_push_back(lof, 0, 42L), "Location 0 does not exist")
    Output
      <error/rlang_error>
      Error in `lof_arr_push_back()`:
      ! Location 0 does not exist.
      i In file 'rlang/dyn-list-of.c' at line 167.
      i This is an internal error in the rlang package, please report it to the package authors.
    Code
      err(lof_arr_push_back(lof, 10, 42L), "Location 10 does not exist")
    Output
      <error/rlang_error>
      Error in `lof_arr_push_back()`:
      ! Location 10 does not exist.
      i In file 'rlang/dyn-list-of.c' at line 167.
      i This is an internal error in the rlang package, please report it to the package authors.

# re-encoding fails purposefully with any bytes

    Code
      (expect_error(r_obj_encode_utf8(bytes)))
    Output
      <simpleError in r_obj_encode_utf8(bytes): translating strings with "bytes" encoding is not allowed>

---

    Code
      (expect_error(r_obj_encode_utf8(c(enc, bytes))))
    Output
      <simpleError in r_obj_encode_utf8(c(enc, bytes)): translating strings with "bytes" encoding is not allowed>

---

    Code
      (expect_error(r_obj_encode_utf8(c(enc, bytes))))
    Output
      <simpleError in r_obj_encode_utf8(c(enc, bytes)): translating strings with "bytes" encoding is not allowed>

---

    Code
      (expect_error(r_obj_encode_utf8(c(enc, bytes))))
    Output
      <simpleError in r_obj_encode_utf8(c(enc, bytes)): translating strings with "bytes" encoding is not allowed>

