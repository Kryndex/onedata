"""Utils and fixtures to facilitate operation on file row in file browser
in oneprovider web GUI.
"""

from selenium.webdriver import ActionChains

from tests.gui.utils.core.common import PageObject
from tests.gui.utils.core.web_elements import TextLabelWebElement, \
    IconWebElement
from tests.gui.utils.generic import click_on_web_elem

__author__ = "Bartosz Walkowicz"
__copyright__ = "Copyright (C) 2017 ACK CYFRONET AGH"
__license__ = "This software is released under the MIT license cited in " \
              "LICENSE.txt"


class FileRow(PageObject):
    name = TextLabelWebElement('.file-label', parent_name='given file row')
    size = TextLabelWebElement('.file-list-col-size')
    modification_date = TextLabelWebElement('.file-list-col-modification')

    _icon = IconWebElement('.file-icon .one-icon')
    _metadata_tool = IconWebElement('.file-tool-metadata')
    _share_tool = IconWebElement('.file-tool-share')

    def __str__(self):
        return '{item} in {parent}'.format(item=self.name,
                                           parent=str(self.parent))

    def is_selected(self):
        return 'active' in self.web_elem.get_attribute('class')

    def is_file(self):
        return 'file' in self._icon.get_attribute('class')

    def is_directory(self):
        return 'folder' in self._icon.get_attribute('class')

    def is_shared(self):
        return 'share' in self._icon.get_attribute('class')

    def is_tool_visible(self, name):
        tool = getattr(self, '_{tool}_tool'.format(tool=name))
        return '25p' in tool.get_attribute('class')

    def click_on_tool(self, name):
        tool = getattr(self, '_{tool}_tool'.format(tool=name))
        tool_icon = tool.find_element_by_css_selector('.oneicon')
        click_on_web_elem(self.driver, tool_icon,
                          lambda: 'cannot click on "{}" in '
                                  '{}'.format(name, self))

    def double_click(self):
        ActionChains(self.driver).double_click(self.web_elem).perform()
