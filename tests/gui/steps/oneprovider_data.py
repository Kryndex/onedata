"""Steps for features of Onezone login page.
"""

__author__ = "Jakub Liput"
__copyright__ = "Copyright (C) 2016 ACK CYFRONET AGH"
__license__ = "This software is released under the MIT license cited in " \
              "LICENSE.txt"

import re
from tests.gui.conftest import WAIT_FRONTEND, WAIT_BACKEND
from tests.gui.utils.generic import upload_file_path
from pytest_bdd import when, then, parsers
from selenium.webdriver.support.ui import WebDriverWait as Wait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By


@when(parsers.re(r'user uses spaces select to change data space to "(?P<space_name>.+)"'))
def change_space(selenium, space_name):
    # HACK: because Firefox driver have buggy EC.element_to_be_clickable,
    # we wait for loader to disappear
    Wait(selenium, WAIT_FRONTEND).until(
        EC.invisibility_of_element_located((By.CSS_SELECTOR, '.common-loader-spinner'))
    )
    Wait(selenium, WAIT_FRONTEND).until(
        EC.element_to_be_clickable((By.CSS_SELECTOR, '.data-spaces-select a[data-toggle=dropdown]'))
    ).click()
    spaces = selenium.find_elements_by_css_selector('.data-spaces-select .dropdown-menu a')

    def space_by_name(_):
        named_spaces = [s for s in spaces if re.match(space_name, s.text.strip(), re.I)]
        if len(named_spaces) > 0 and named_spaces[0].is_enabled():
            return named_spaces[0]
        else:
            return None

    Wait(selenium, WAIT_FRONTEND).until(space_by_name).click()

    def file_browser_ready(driver):
        files_table = driver.find_element_by_css_selector('.files-table')
        return not re.match(r'.*is-loading.*', files_table.get_attribute('class'))

    Wait(selenium, WAIT_BACKEND).until(file_browser_ready)


@when(parsers.parse('user uses upload button in toolbar to upload file "{file_name}" to current dir'))
def upload_file_to_current_dir(selenium, file_name):
    """This interaction is very hacky, because uploading files with Selenium
    needs to use input element, but we do not use it directly in frontend.
    So we unhide an input element for a while and pass a local file path to it.
    """
    # HACK: for Firefox driver - because we cannot interact with hidden elements
    selenium.execute_script("$('input#toolbar-file-browse').removeClass('hidden')")
    selenium.find_element_by_css_selector('input#toolbar-file-browse').send_keys(
        upload_file_path(file_name)
    )
    selenium.execute_script("$('input#toolbar-file-browse').addClass('hidden')")


# @when(parsers.parse('The upload of file "{file_name}" fails'))
# @then(parsers.parse('The upload of file "{file_name}" should fail'))
# def upload_fails(selenium, file_name):
#     Wait(selenium, 2*WAIT_BACKEND).until(
#         lambda s: notify_visible_with_text(s, 'error', re.compile(r'.*' + file_name + r'.*' + 'failed' + r'.*'))
#     )
#
#
# @then(parsers.parse('The upload of file "{file_name}" should succeed'))
# def upload_succeeds(selenium, file_name):
#     Wait(selenium, 2*WAIT_BACKEND).until(
#         lambda s: notify_visible_with_text(s, 'info', re.compile(r'.*' + file_name + r'.*' + 'successfully' + r'.*'))
#     )