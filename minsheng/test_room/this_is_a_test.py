# -*- coding: utf-8 -*-
import warnings


def turn_left():
    warnings.warn("即将废弃", DeprecationWarning)
    return 'left'

if __name__ == '__main__':
    print turn_left()
