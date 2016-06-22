"""This module contains utility functions for operations on strings and regexps
"""
__author__ = "Jakub Kudzia"
__copyright__ = "Copyright (C) 2016 ACK CYFRONET AGH"
__license__ = "This software is released under the MIT license cited in " \
              "LICENSE.txt"

import re


def parse(regex, string, *groups):
    """Parse matching regex from string, return groups passed in groups argument
    """
    if groups:
        pattern = re.compile(regex)
        m = re.match(pattern, string)
        if len(groups) > 1:
            out = []
            for i in groups:
                out.append(m.group(i))
            return tuple(out)
        else:
            return m.group(1)
