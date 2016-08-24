"""Module implements pytest-bdd steps for authorization and mounting oneclient.
"""
__author__ = "Jakub Kudzia"
__copyright__ = "Copyright (C) 2015 ACK CYFRONET AGH"
__license__ = "This software is released under the MIT license cited in " \
              "LICENSE.txt"

import multi_auth_steps
from tests.utils.acceptance_utils import *
from tests.utils.client_utils import mount_users

from pytest_bdd import given


@given(parsers.parse('{user} starts oneclient in {mount_path} using {token}'))
def default_mount(user, mount_path, token, request, onedata_environment, context,
                  client_dockers, env_description_file, test_type, providers):
    mount_users(request, onedata_environment, context, client_dockers, env_description_file,
                test_type, providers, user_names=[user], client_instances=["client1"],
                mount_paths=[mount_path], client_hosts=['client-host1'],
                tokens=[token])


@when(parsers.parse('{spaces} is mounted for {user}'))
@then(parsers.parse('{spaces} is mounted for {user}'))
@when(parsers.parse('{spaces} are mounted for {user}'))
@then(parsers.parse('{spaces} are mounted for {user}'))
def check_spaces(spaces, user, context):
    multi_auth_steps.check_spaces(spaces, user, make_arg_list("client1"),
                                  context)


@when(parsers.parse('{user} remounts oneclient'))
@then(parsers.parse('{user} remounts oneclient'))
def remount_client(user, onedata_environment, context):
    multi_auth_steps.remount_client(user, 'client1', onedata_environment, context)