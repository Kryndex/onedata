"""Utils and fixtures to facilitate operations on Oneprovider web GUI.
"""

__author__ = "Jakub Liput, Bartosz Walkowicz"
__copyright__ = "Copyright (C) 2016 ACK CYFRONET AGH"
__license__ = "This software is released under the MIT license cited in " \
              "LICENSE.txt"


# def assert_breadcrumbs_correctness(path, breadcrumbs):
#     cwd = breadcrumbs.text.split()
#     path = path.split('/')
#     err_msg = '{} not found on {} position in breadcrumbs, instead we have {}'
#     assert len(path) == len(cwd), 'found {} path in breadcrumbs ' \
#                                   'instead of {}'.format(cwd, path)
#     for i, (dir1, dir2) in enumerate(zip(path, cwd)):
#         assert dir1 == dir2, err_msg.format(dir1, i, '/'.join(cwd))
#
#
# def chdir_using_breadcrumbs(path, breadcrumbs):
#     dir1, dir2 = None, None
#     err_msg = '{} not found on {} position in breadcrumbs, instead we have {}'
#     for i, (dir1, dir2) in enumerate(zip(path.split('/'), breadcrumbs)):
#         assert dir1 == dir2.text, err_msg.format(dir1, i,
#                                                  '/'.join(directory.text
#                                                           for directory
#                                                           in breadcrumbs)
#                                                  )
#     dir2.click()
#
#
# this function was blocking import of this module because of errors
# def current_dir(driver):
#     return RE_DATA_URL.match(
#         parse_url(driver.current_url).group('method')
#     ).group('dir')
