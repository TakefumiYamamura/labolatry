#!/usr/bin/env python

"""
setup.py file for SWIG test
"""

from distutils.core import setup, Extension


test_module = Extension('_test',
                           sources=['test_wrap.cxx', 'test.cpp'],
                           )

setup (name = 'test',
       version = '0.1',
       author      = "SWIG Docs",
       description = """Simple swig test from docs""",
       ext_modules = [test_module],
       py_modules = ["test"],
       )