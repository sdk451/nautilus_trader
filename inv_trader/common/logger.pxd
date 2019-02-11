#!/usr/bin/env python3
# -------------------------------------------------------------------------------------------------
# <copyright file="logger.pxd" company="Invariance Pte">
#  Copyright (C) 2018-2019 Invariance Pte. All rights reserved.
#  The use of this source code is governed by the license as found in the LICENSE.md file.
#  http://www.invariance.com
# </copyright>
# -------------------------------------------------------------------------------------------------

# cython: language_level=3, boundscheck=False, wraparound=False, nonecheck=False

from inv_trader.common.clock cimport Clock
from inv_trader.model.objects cimport ValidString


cdef class Logger:
    """
    Provides a logger for the trader client which wraps the Python logging module.
    """
    cdef object _log_level_console
    cdef object _log_level_file
    cdef bint _console_prints
    cdef bint _log_to_file
    cdef str _log_file
    cdef object _log_file_handler
    cdef object _logger
    cdef Clock _clock
    cdef object _queue
    cdef object _thread

    cdef readonly bint bypass_logging

    cpdef void log(self, tuple message)
    cpdef void _debug(self, ValidString message)
    cpdef void _info(self, ValidString message)
    cpdef void _warning(self, ValidString message)
    cpdef void _error(self, ValidString message)
    cpdef void _critical(self, ValidString message)
    cpdef void _process_messages(self)
    cdef str _format_message(self, str log_level, str message)
    cdef void _console_print_handler(self, log_level, str message, )


cdef class LoggerAdapter:
    """
    Provides a logger adapter adapter for a components logger.
    """
    cdef Logger _logger

    cdef readonly bint bypassed
    cdef readonly str component_name

    cpdef void debug(self, str message)
    cpdef void info(self, str message)
    cpdef void warning(self, str message)
    cpdef void error(self, str message)
    cpdef void critical(self, str message)
    cdef ValidString _format_message(self, str message)
