Feature: Oneprovider POSIX privileges GUI tests

  Background:
    Given user opened browser window
    And user of browser opened Onezone URL
    And user of browser clicked on the "plgrid" login button
    And user of browser clicked on the "user1" link
    And user of browser expanded the "go to your files" Onezone sidebar panel
    And user of browser clicked on the "p1" provider in Onezone providers sidebar panel
    And user of browser clicked on the "Go to your files" button in provider popup
    And user of browser seen that Oneprovider session has started


  Scenario: User sees that new file default permission code is 664
    
	# Create file       
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create file"
    And user of browser sees that "New file" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "file1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Check permission code
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    Then user of browser sees that current permission is "664"
    And user of browser clicks on input box in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "file1" has disappeared from files browser


  Scenario: User sees that new directory default permission code is 775
    
	# Create directory           
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create directory"
    And user of browser sees that "New directory" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "dir1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Check permission code
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    Then user of browser sees that current permission is "775"
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "dir1" has disappeared from files browser


  Scenario: User changes file permission (presses ENTER after entering new permission code)
    
	# Create file
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create file"
    And user of browser sees that "New file" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "file1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Change permission code
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "775" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Check permission code
    Then user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser sees that current permission is "775"
    And user of browser clicks on input box in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "file1" has disappeared from files browser


  Scenario: User changes file permission (clicks confirmation button after entering new permission code)
    
	# Create file
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create file"
    And user of browser sees that "New file" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "file1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Change permission code
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "775" permission code in active modal
    And user of browser clicks "Ok" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    
	# Check permission code
    Then user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser sees that current permission is "775"
    And user of browser clicks "Ok" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "file1" has disappeared from files browser


  Scenario: User changes directory permission (presses ENTER after entering new permission code)
    
	# Create directory
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create directory"
    And user of browser sees that "New directory" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "dir1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Change permission code
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "664" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Check permission code
    Then user of browser selects "dir" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser sees that current permission is "664"
    And user of browser clicks on input box in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "dir1" has disappeared from files browser


  Scenario: User changes directory permission (clicks confirmation button after entering new permission code)
    
	# Create directory
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create directory"
    And user of browser sees that "New directory" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "dir1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Change permission code
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "664" permission code in active modal
    And user of browser clicks "OK" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    
	# Check permission code
    Then user of browser selects "dir" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser sees that current permission is "664"
    And user of browser clicks on input box in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "dir1" has disappeared from files browser


  Scenario: User fails to download file because of lack in privileges
    
	# Create file
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create file"
    And user of browser sees that "New file" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "file1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Change permission code
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "220" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Fail to download file
    And user of browser double clicks on item named "file1" in file browser
    Then user of browser sees that "Cannot download file" modal has appeared
    And user of browser clicks "OK" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "file1" has disappeared from files browser


  Scenario: User fails to upload file because of lack in privileges
    
	# Create directory
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create directory"
    And user of browser sees that "New directory" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "dir1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Change permission code
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "553" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Fail to upload file
    And user of browser double clicks on item named "dir1" in file browser
    And user of browser uses upload button in toolbar to upload file "20B-0.txt" to current dir
    Then user of browser sees an error notify with text matching to: .*failed.*
    
	#TODO rm after integrating with swagger
    And user of browser changes current working directory to space1 using breadcrumbs
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "dir1" has disappeared from files browser
    

  Scenario: User fails to create file because of lack in privileges
    
	# Create directory
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create directory"
    And user of browser sees that "New directory" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "dir1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Change permission code
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "553" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Fail to create file
    And user of browser double clicks on item named "dir1" in file browser
    And user of browser clicks the button from top menu bar with tooltip "Create file"
    And user of browser sees that "New file" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "file1" on keyboard
    And user of browser presses enter on keyboard
    Then user of browser sees an error notify with text matching to: .*[Aa]ccess denied.*
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser changes current working directory to space1 using breadcrumbs
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "dir1" has disappeared from files browser


  Scenario: User fails to remove file because of lack in privileges
    
	# Create directory
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create directory"
    And user of browser sees that "New directory" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "dir1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Create file
    And user of browser double clicks on item named "dir1" in file browser
    And user of browser clicks the button from top menu bar with tooltip "Create file"
    And user of browser sees that "New file" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "file1" on keyboard
    And user of browser presses enter on keyboard
    
	# Change permission code
    And user of browser changes current working directory to space1 using breadcrumbs
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "553" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Fail to remove file
    And user of browser double clicks on item named "dir1" in file browser
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    Then user of browser sees an error notify with text matching to: .*[Aa]ccess denied.*
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser changes current working directory to space1 using breadcrumbs
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "775" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "dir1" has disappeared from files browser


  Scenario: User fails to rename file because of lack in privileges
    
	# Create directory
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create directory"
    And user of browser sees that "New directory" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "dir1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Create file
    And user of browser double clicks on item named "dir1" in file browser
    And user of browser clicks the button from top menu bar with tooltip "Create file"
    And user of browser sees that "New file" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "file1" on keyboard
    And user of browser presses enter on keyboard
    
	# Change permission code
    And user of browser changes current working directory to space1 using breadcrumbs
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "553" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Fail to rename file    
    And user of browser double clicks on item named "dir1" in file browser
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Rename element"
    And user of browser sees that "Rename file or directory" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "new_file1" on keyboard
    And user of browser presses enter on keyboard
    Then user of browser sees an error notify with text matching to: .*[Aa]ccess denied.*
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser changes current working directory to space1 using breadcrumbs
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "775" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "dir1" has disappeared from files browser


  Scenario: User fails to remove directory because of lack in privileges
    
	# Create directory dir1
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create directory"
    And user of browser sees that "New directory" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "dir1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Create directory dir2
    And user of browser double clicks on item named "dir1" in file browser
    And user of browser clicks the button from top menu bar with tooltip "Create directory"
    And user of browser sees that "New directory" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "dir2" on keyboard
    And user of browser presses enter on keyboard
    
	# Change permission code
    And user of browser changes current working directory to space1 using breadcrumbs
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "553" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Fail to remove directory
    And user of browser double clicks on item named "dir1" in file browser
    And user of browser selects "dir2" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    Then user of browser sees an error notify with text matching to: .*[Aa]ccess denied.*
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser changes current working directory to space1 using breadcrumbs
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "775" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "dir1" has disappeared from files browser


  Scenario: User fails to remove directory containing file because of lack in privileges
    
	# Create directory
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create directory"
    And user of browser sees that "New directory" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "dir1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Create file
    And user of browser double clicks on item named "dir1" in file browser
    And user of browser clicks the button from top menu bar with tooltip "Create file"
    And user of browser sees that "New file" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "file1" on keyboard
    And user of browser presses enter on keyboard
    
	# Change permission code
    And user of browser changes current working directory to space1 using breadcrumbs
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "553" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Fail to remove directory    
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    Then user of browser sees an error notify with text matching to: .*[Aa]ccess denied.*
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser changes current working directory to space1 using breadcrumbs
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets "775" permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    And user of browser selects "dir1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "dir1" has disappeared from files browser


  Scenario: "Ok" confirmation button is disabled after entering incorrect permission code (3 char)
    
	# Create file       
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create file"
    And user of browser sees that "New file" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "file1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Change permission code
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets incorrect 3 char permission code in active modal
    And user of browser sees that "Ok" item displayed in modal is disabled
    And user of browser clicks "Cancel" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "file1" has disappeared from files browser


  Scenario: User fails to change permission code to incorrect one (2 char, presses enter after entering permission code)
    
	# Create file       
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create file"
    And user of browser sees that "New file" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "file1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Fail to change permission code
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets incorrect 2 char permission code in active modal
    And user of browser presses enter on keyboard
    And user of browser sees an error notify with text matching to: .*failed.*
    And user of browser clicks "Cancel" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "file1" has disappeared from files browser


  Scenario: User fails to change permission code to incorrect one (2 char, clicks confirmation button after entering permission code)
    
	# Create file       
    When user of browser uses spaces select to change data space to "space1"
    And user of browser sees file browser in data tab in Oneprovider page
    And user of browser clicks the button from top menu bar with tooltip "Create file"
    And user of browser sees that "New file" modal has appeared
    And user of browser clicks on input box in active modal
    And user of browser types "file1" on keyboard
    And user of browser presses enter on keyboard
    And user of browser sees that the modal has disappeared
    
	# Fail to change permission code
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Change element permissions"
    And user of browser sees that "Edit permissions" modal has appeared
    And user of browser selects "POSIX" permission type in active modal
    And user of browser clicks on input box in active modal
    And user of browser sets incorrect 2 char permission code in active modal
    And user of browser clicks "Ok" confirmation button in displayed modal
    And user of browser sees an error notify with text matching to: .*failed.*
    And user of browser clicks "Cancel" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    
	#TODO rm after integrating with swagger
    And user of browser selects "file1" from files list
    And user of browser clicks the button from top menu bar with tooltip "Remove element"
    And user of browser sees that "Remove files" modal has appeared
    And user of browser clicks "Yes" confirmation button in displayed modal
    And user of browser sees that the modal has disappeared
    And user of browser sees that item named "file1" has disappeared from files browser
