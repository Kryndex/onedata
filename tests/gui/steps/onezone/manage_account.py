"""Steps for MANAGE ACCOUTN top bar features of Onezone page.
"""

from pytest_bdd import parsers, when, then

from tests.gui.conftest import WAIT_BACKEND, WAIT_FRONTEND
from tests.gui.utils.generic import repeat_failed

__author__ = "Bartosz Walkowicz"
__copyright__ = "Copyright (C) 2017 ACK CYFRONET AGH"
__license__ = "This software is released under the MIT license cited in " \
              "LICENSE.txt"


@when(parsers.parse('user of {browser_id} expands account settings '
                    'dropdown in "ACCOUNT MANAGE" Onezone top bar'))
@then(parsers.parse('user of {browser_id} expands account settings '
                    'dropdown in "ACCOUNT MANAGE" Onezone top bar'))
@repeat_failed(timeout=WAIT_FRONTEND)
def expand_account_settings_in_oz(selenium, browser_id, oz_page):
    driver = selenium[browser_id]
    oz_page(driver)['manage account'].expand()


@when(parsers.re(r'user of (?P<browser_id>.+?) clicks on (?P<option>LOGOUT) '
                 r'item in expanded settings dropdown in "ACCOUNT MANAGE" '
                 r'Onezone top bar'))
@then(parsers.re(r'user of (?P<browser_id>.+?) clicks on (?P<option>LOGOUT) '
                 r'item in expanded settings dropdown in "ACCOUNT MANAGE" '
                 r'Onezone top bar'))
def click_on_option_in_account_settings_in_oz(selenium, browser_id,
                                              option, oz_page):
    driver = selenium[browser_id]
    action = getattr(oz_page(driver)['manage account'], option.lower())
    action()
