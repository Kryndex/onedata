"""Test suite for POSIX privileges acceptance mixed tests  
"""
__author__ = "Michal Stanisz"
__copyright__ = "Copyright (C) 2017 ACK CYFRONET AGH"
__license__ = "This software is released under the MIT license cited in " \
              "LICENSE.txt"


import pytest
from functools import partial
from pytest_bdd import scenarios, scenario

from tests.acceptance.steps.env_steps import *
from tests.acceptance.steps.auth_steps import *
from tests.acceptance.steps.dir_steps import *
from tests.acceptance.steps.file_steps import *
from tests.acceptance.steps.file_steps import *
from tests.utils.acceptance_utils import *

from tests.gui.steps.common import *
from tests.gui.steps.modal import *

from tests.gui.steps.generic.url import *
from tests.gui.steps.generic.browser_creation import *
from tests.gui.steps.generic.copy_paste import *

from tests.gui.steps.onezone.logged_in_common import *
from tests.gui.steps.onezone.user_alias import *
from tests.gui.steps.onezone.access_tokens import *
from tests.gui.steps.onezone.data_space_management import *
from tests.gui.steps.onezone.providers import *
from tests.gui.steps.onezone.manage_account import *

from tests.gui.steps.oneprovider.data_tab import *
from tests.gui.steps.oneprovider.file_browser import *

from tests.gui.steps.oneservices.cdmi import *

from tests.gui.steps.onezone_before_login import *
from tests.gui.steps.onezone_provider_popup import *
from tests.gui.steps.onezone_providers import *

from tests.gui.steps.oneprovider_common import *
from tests.gui.steps.oneprovider_data import *
from tests.gui.steps.oneprovider_spaces import *
from tests.gui.steps.oneprovider_shares import *
from tests.gui.steps.oneprovider_metadata import *
from tests.gui.steps.oneprovider_file_list import *
from tests.gui.steps.oneprovider_sidebar_list import *
from tests.gui.steps.oneprovider_permissions import *


scenario = partial(scenario, "../features/oneprovider_privileges_posix.feature")

@pytest.mark.xfail(reason="File permissions don't change in client after "
                          "change in web gui, VFS-3503")
@scenario('User creates file using oneclient and changes its permission using'
          ' web gui')
def test_create_file_using_oneclient_and_change_permission_using_web_gui():
    pass

scenarios('../features/oneprovider_privileges_posix.feature')
