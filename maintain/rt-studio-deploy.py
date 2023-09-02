import shutil
import os
import win32con, win32api

shutil.rmtree(os.path.join('..', 'tools', 'gnu_gcc'))
win32api.SetFileAttributes(os.path.join('..', '.git'), win32con.FILE_ATTRIBUTE_NORMAL)
