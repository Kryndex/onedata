"""Steps used for handling of data tab elements (e.g. toolbar)
in various GUI testing scenarios
"""

import pytest
from pytest_bdd import given, when, then, parsers

from pytest_selenium_multi.pytest_selenium_multi import select_browser

from tests.gui.conftest import WAIT_BACKEND, SELENIUM_IMPLICIT_WAIT
from tests.gui.utils.generic import repeat_failed, implicit_wait, parse_seq

__author__ = "Bartek Walkowicz"
__copyright__ = "Copyright (C) 2017 ACK CYFRONET AGH"
__license__ = "This software is released under the MIT license cited in " \
              "LICENSE.txt"


@when(parsers.parse('user of {browser_id} uses spaces select to change '
                    'data space to "{space_name}"'))
@then(parsers.parse('user of {browser_id} uses spaces select to change '
                    'data space to "{space_name}"'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def change_space_view_in_data_tab_in_op(selenium, browser_id,
                                        space_name, op_page):
    driver = select_browser(selenium, browser_id)
    selector = op_page(driver).data.sidebar.space_selector
    selector.expand()
    selector[space_name].click()


@when(parsers.parse('user of {browser_id} clicks the button from top menu bar '
                    'with tooltip "{tooltip_name}"'))
@then(parsers.parse('user of {browser_id} clicks the button from top menu bar '
                    'with tooltip "{tooltip_name}"'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def click_tooltip_from_toolbar_in_data_tab_in_op(selenium, browser_id,
                                                 tooltip_name, op_page):
    driver = select_browser(selenium, browser_id)
    op_page(driver).data.toolbar[tooltip_name].click()


@when(parsers.parse('user of {browser_id} sees that {btn_list} button(s) '
                    'is(are) enabled in toolbar in data tab in Oneprovider gui'))
@then(parsers.parse('user of {browser_id} sees that {btn_list} button(s) '
                    'is(are) enabled in toolbar in data tab in Oneprovider gui'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def click_tooltip_from_toolbar_in_data_tab_in_op(selenium, browser_id,
                                                 btn_list, op_page):
    driver = select_browser(selenium, browser_id)
    toolbar = op_page(driver).data.toolbar
    err_msg = '{} should be disabled but is not'
    for btn in parse_seq(btn_list):
        item = toolbar[btn]
        assert item.is_enabled() is True, err_msg.format(item)


@when(parsers.parse('user of {browser_id} sees that {btn_list} button(s) is(are) '
                    'disabled in toolbar in data tab in Oneprovider gui'))
@then(parsers.parse('user of {browser_id} sees that {btn_list} button(s) is(are) '
                    'disabled in toolbar in data tab in Oneprovider gui'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def click_tooltip_from_toolbar_in_data_tab_in_op(selenium, browser_id,
                                                 btn_list, op_page):
    driver = select_browser(selenium, browser_id)
    toolbar = op_page(driver).data.toolbar
    err_msg = '{} btn should be disabled but is not in toolbar in op data tab'
    for btn in parse_seq(btn_list):
        assert toolbar[btn].is_enabled() is False, err_msg.format(btn)


@when(parsers.parse('user of {browser_id} sees that current working directory '
                    'displayed in breadcrumbs is {path}'))
@then(parsers.parse('user of {browser_id} sees that current working directory '
                    'displayed in breadcrumbs is {path}'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def is_displayed_breadcrumbs_in_data_tab_in_op_correct(selenium, browser_id,
                                                       path, op_page):
    driver = select_browser(selenium, browser_id)
    breadcrumbs = op_page(driver).data.breadcrumbs.pwd()
    assert path == breadcrumbs, \
        'expected breadcrumbs {}; displayed: {}'.format(path, breadcrumbs)


@when(parsers.parse('user of {browser_id} changes current working directory '
                    'to {path} using breadcrumbs'))
@then(parsers.parse('user of {browser_id} changes current working directory '
                    'to {path} using breadcrumbs'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def change_cwd_using_breadcrumbs_in_data_tab_in_op(selenium, browser_id,
                                                   path, op_page):
    driver = select_browser(selenium, browser_id)
    op_page(driver).data.breadcrumbs.chdir(path)


@when(parsers.parse('user of {browser_id} sees that current working directory '
                    'displayed in directory tree is {path}'))
@then(parsers.parse('user of {browser_id} sees that current working directory '
                    'displayed in directory tree is {path}'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def is_displayed_dir_tree_in_data_tab_in_op_correct(selenium, browser_id,
                                                    path, op_page):
    driver = select_browser(selenium, browser_id)
    with implicit_wait(driver, 0.05, SELENIUM_IMPLICIT_WAIT):
        pwd = op_page(driver).data.sidebar.cwd.pwd()
    assert path == pwd, 'expected path {}\n got: {}'.format(path, pwd)


@when(parsers.parse('user of {browser_id} changes current working directory '
                    'to {path} using directory tree'))
@then(parsers.parse('user of {browser_id} changes current working directory '
                    'to {path} using directory tree'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def change_cwd_using_dir_tree_in_data_tab_in_op(selenium, browser_id,
                                                path, op_page):
    driver = select_browser(selenium, browser_id)
    cwd = op_page(driver).data.sidebar.root_dir
    cwd.click()
    for directory in (dir for dir in path.split('/') if dir != ''):
        if not cwd.is_expanded():
            cwd.expand()
        cwd = cwd[directory]
        cwd.click()


@when(parsers.parse('user of {browser_id} does not see {path} in directory tree'))
@then(parsers.parse('user of {browser_id} does not see {path} in directory tree'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def assert_absence_of_path_in_dir_tree(selenium, browser_id, path, op_page):
    driver = select_browser(selenium, browser_id)
    curr_dir = op_page(driver).data.sidebar.root_dir
    with pytest.raises(RuntimeError):
        for directory in (dir for dir in path.split('/') if dir != ''):
            with implicit_wait(driver, 0.05, SELENIUM_IMPLICIT_WAIT):
                curr_dir = curr_dir[directory]


@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def _is_space_tree_root(driver, is_home, space_name, op_page):
    selector = op_page(driver).data.sidebar.space_selector
    displayed_name = selector.selected_space_name
    err_msg = 'current directory tree is displayed for "{}" instead of "{}"'
    assert displayed_name == space_name, err_msg.format(displayed_name,
                                                        space_name)
    if is_home:
        assert selector.is_selected_space_home() is True, \
            'space {} is not home space'.format(displayed_name)


@given(parsers.re('user of (?P<browser_id>.+?) seen that displayed directory '
                  'tree in sidebar panel belonged to (?P<is_home>(home )?)space '
                  'named "(?P<space_name>.+?)'))
def g_is_space_tree_root(selenium, browser_id, is_home, space_name, op_page):
    driver = select_browser(selenium, browser_id)
    _is_space_tree_root(driver, True if is_home else False, space_name, op_page)


@when(parsers.re('user of (?P<browser_id>.+?) sees that displayed directory '
                 'tree in sidebar panel belongs to (?P<is_home>(home )?)space '
                 'named "(?P<space_name>.+?)"'))
@then(parsers.re('user of (?P<browser_id>.+?) sees that displayed directory '
                 'tree in sidebar panel belongs to (?P<is_home>(home )?)space '
                 'named "(?P<space_name>.+?)"'))
def wt_is_space_tree_root(selenium, browser_id, is_home, space_name, op_page):
    driver = select_browser(selenium, browser_id)
    _is_space_tree_root(driver, True if is_home else False, space_name, op_page)


@when(parsers.parse('user of {browser_id} sees nonempty file browser '
                    'in data tab in Oneprovider page'))
@then(parsers.parse('user of {browser_id} sees nonempty file browser '
                    'in data tab in Oneprovider page'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def assert_nonempty_file_browser_in_data_tab_in_op(selenium, browser_id,
                                                   op_page, tmp_memory):
    driver = select_browser(selenium, browser_id)
    file_browser = op_page(driver).data.file_browser

    with implicit_wait(driver, 1, SELENIUM_IMPLICIT_WAIT):
        assert not file_browser.is_empty(), 'file browser in data tab in op' \
                                            'should not be empty but is'

    tmp_memory[browser_id]['file_browser'] = file_browser


@when(parsers.parse('user of {browser_id} sees empty file browser '
                    'in data tab in Oneprovider page'))
@then(parsers.parse('user of {browser_id} sees empty file browser '
                    'in data tab in Oneprovider page'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def assert_empty_file_browser_in_data_tab_in_op(selenium, browser_id,
                                                op_page, tmp_memory):
    driver = select_browser(selenium, browser_id)
    file_browser = op_page(driver).data.file_browser

    with implicit_wait(driver, 1, SELENIUM_IMPLICIT_WAIT):
        assert file_browser.is_empty(), 'file browser in data tab in op' \
                                        'should be empty but is not'

    tmp_memory[browser_id]['file_browser'] = file_browser


@when(parsers.parse('user of {browser_id} sees file browser '
                    'in data tab in Oneprovider page'))
@then(parsers.parse('user of {browser_id} sees file browser '
                    'in data tab in Oneprovider page'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def assert_file_browser_in_data_tab_in_op(selenium, browser_id,
                                          op_page, tmp_memory):
    driver = select_browser(selenium, browser_id)
    file_browser = op_page(driver).data.file_browser
    tmp_memory[browser_id]['file_browser'] = file_browser


@when(parsers.parse('user of {browser_id} sees displayed name length for '
                    '{path} in directory tree sidebar'))
@when(parsers.parse('user of {browser_id} sees displayed name length for '
                    '{path} in directory tree sidebar'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def check_displayed_dir_name_len_in_dir_tree(selenium, browser_id, path,
                                             op_page, tmp_memory):
    driver = select_browser(selenium, browser_id)
    cwd = op_page(driver).data.sidebar.root_dir
    cwd.click()
    for directory in (dir for dir in path.split('/') if dir != ''):
        cwd = cwd[directory]

    tmp_memory[browser_id][path] = cwd.displayed_name_width


@when(parsers.parse('user of {browser_id} sees that displayed name length for '
                    '{path} in directory tree sidebar is larger than before'))
@then(parsers.parse('user of {browser_id} sees that displayed name length for '
                    '{path} in directory tree sidebar is larger than before'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def assert_diff_in_len_of_dir_name_before_and_now(selenium, browser_id, path,
                                                  op_page, tmp_memory):
    driver = select_browser(selenium, browser_id)
    cwd = op_page(driver).data.sidebar.root_dir
    cwd.click()
    for directory in (dir for dir in path.split('/') if dir != ''):
        cwd = cwd[directory]

    prev_len = tmp_memory[browser_id][path]
    curr_len = cwd.displayed_name_width
    assert prev_len != curr_len, \
        'name len of {} is the same as before {}'.format(path, curr_len)


@when(parsers.re(r'user of (?P<browser_id>.+?) expands data tab sidebar to the '
                 r'(?P<direction>right|left) of approximately (?P<offset>\d+)px'))
@then(parsers.re(r'user of (?P<browser_id>.+?) expands data tab sidebar to the '
                 r'(?P<direction>right|left) of approximately (?P<offset>\d+)px'))
@repeat_failed(attempts=WAIT_BACKEND, timeout=True)
def resize_data_tab_sidebar(selenium, browser_id, direction, offset, op_page):
    driver = select_browser(selenium, browser_id)
    sidebar = op_page(driver).data.sidebar
    offset = (-1 if direction == 'left' else 1) * int(offset)
    sidebar.width += offset
