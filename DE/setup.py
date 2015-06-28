#!/usr/bin/env python

"""
setup.py file for SWIG example
"""

from distutils.core import setup, Extension


test_func_module = Extension('_test_func',
                           sources=['test_func_wrap.c', 'test_func.cpp'],
                           )

setup (name = 'example',
       version = '0.1',
       author      = "SWIG Docs",
       description = """Simple swig example from docs""",
       ext_modules = [test_func_module],
       py_modules = ["test_func"],
       )