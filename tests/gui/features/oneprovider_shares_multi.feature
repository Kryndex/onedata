Feature: Oneprovider Share view
  Various operations on Share view using multiple browsers

  Background:
    Given users opened [browser1, browser2] browsers' windows
    And user of browser1 opened Onezone URL
    And user of browser1 clicked on the "plgrid" login button
    And user of browser1 clicked on the "user1" link
    And user of browser1 expanded the "go to your files" Onezone sidebar panel
    And user of browser1 clicked on the "p1" provider in Onezone providers sidebar panel
    And user of browser1 clicked on the "Go to your files" button in provider popup
    And user of browser1 seen that Oneprovider session has started


  Scenario: User creates share, sends it's url to other user and downloads files
    When user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 clicks the button from top menu bar with tooltip "Create directory"
    And user of browser1 sees that "New directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "dir1" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir1 directory has appeared in file list

    And user of browser1 double clicks on directory dir1 from files list
    And user of browser1 uses upload button in toolbar to upload file "20B-0.txt" to current dir
    And user of browser1 sees an info notify with text matching to: .*20B-0\.txt.*uploaded successfully.*
    And user of browser1 sees that 20B-0.txt file has appeared in file list

    And user of browser1 clicks the button from top menu bar with tooltip "Create directory"
    And user of browser1 sees that "New directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "dir2" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir2 directory has appeared in file list

    And user of browser1 double clicks on directory dir2 from files list
    And user of browser1 uses upload button in toolbar to upload file "20B-1.txt" to current dir
    And user of browser1 sees an info notify with text matching to: .*20B-1\.txt.*uploaded successfully.*
    And user of browser1 sees that 20B-1.txt file has appeared in file list

    And user of browser1 uses spaces select to change data space to "Small space"
    And user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 selects dir1 from files list
    And user of browser1 clicks the button from top menu bar with tooltip "Share element"

    And user of browser1 sees that "Share the directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "share1" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees an info notify with text matching to: Share created sucessfully
    And user of browser1 sees that modal has disappeared

    And user of browser1 sees that "Share summary" modal has appeared
    And user of browser1 clicks on copy button in active modal
    And user of browser1 sends copied url to users of [browser2]
    And user of browser1 clicks "Open the share" confirmation button in displayed modal
    And user of browser1 sees that url matches https?://[^/]*/#/onedata/shares/.*

    And user of browser1 selects share named "share1" from the shared list
    And user of browser1 sees that current working directory is share1
    And user of browser1 double clicks on directory dir1 from files list
    And user of browser1 sees that current working directory is share1/dir1
    And user of browser1 double clicks on file 20B-0.txt from files list
    And user of browser1 sees that downloaded file "20B-0.txt" contains "00000000000000000000"
    And user of browser1 double clicks on directory dir2 from files list
    And user of browser1 sees that current working directory is share1/dir1/dir2

    And user of browser2 opens received url
    And user of browser2 sees that url matches https?://[^/]*/#/public/shares/.*
    And user of browser2 sees that public share is named "share1"
    And user of browser2 sees that current working directory is share1
    And user of browser2 double clicks on directory dir1 from files list
    And user of browser2 sees that current working directory is share1/dir1
    And user of browser2 double clicks on directory dir2 from files list
    And user of browser2 sees that current working directory is share1/dir1/dir2
    And user of browser2 double clicks on file 20B-1.txt from files list
    And user of browser2 sees that downloaded file "20B-1.txt" contains "11111111111111111111"

    # TODO rm after integrating with swagger
    Then user of browser1 clicks on the "data" tab in main menu sidebar
    And user of browser1 uses spaces select to change data space to "Small space"
    And user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 selects dir1 from files list
    And user of browser1 clicks the button from top menu bar with tooltip "Remove element"
    And user of browser1 sees that "Remove files" modal has appeared
    And user of browser1 clicks "OK" confirmation button in displayed modal
    And user of browser1 sees an success notify with text matching to: .*removed.*
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir1 shared-directory has disappeared from file list


  Scenario: User creates share, sends it's url to other user, renames it and removes it
    When user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 clicks the button from top menu bar with tooltip "Create directory"
    And user of browser1 sees that "New directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "dir1" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir1 directory has appeared in file list

    And user of browser1 double clicks on directory dir1 from files list
    And user of browser1 uses upload button in toolbar to upload file "20B-0.txt" to current dir
    And user of browser1 sees an info notify with text matching to: .*20B-0\.txt.*uploaded successfully.*
    And user of browser1 sees that 20B-0.txt file has appeared in file list

    And user of browser1 clicks the button from top menu bar with tooltip "Create directory"
    And user of browser1 sees that "New directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "dir2" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir2 directory has appeared in file list

    And user of browser1 double clicks on directory dir2 from files list
    And user of browser1 uses upload button in toolbar to upload file "20B-1.txt" to current dir
    And user of browser1 sees an info notify with text matching to: .*20B-1\.txt.*uploaded successfully.*
    And user of browser1 sees that 20B-1.txt file has appeared in file list

    And user of browser1 uses spaces select to change data space to "Small space"
    And user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 selects dir1 from files list
    And user of browser1 clicks the button from top menu bar with tooltip "Share element"

    And user of browser1 sees that "Share the directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "share1" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees an info notify with text matching to: Share created sucessfully
    And user of browser1 sees that modal has disappeared

    And user of browser1 sees that "Share summary" modal has appeared
    And user of browser1 clicks on copy button in active modal
    And user of browser1 sends copied url to users of [browser2]
    And user of browser1 clicks "Open the share" confirmation button in displayed modal
    And user of browser1 sees that url matches https?://[^/]*/#/onedata/shares/.*

    And user of browser1 selects share named "share1" from the shared list
    And user of browser1 sees that selected share is named "share1"

    And user of browser2 opens received url
    And user of browser2 sees that url matches https?://[^/]*/#/public/shares/.*
    And user of browser2 sees that public share is named "share1"
    And user of browser2 sees that current working directory is share1/dir1

    And user of browser1 clicks a settings icon displayed for "share1" item on the shares list
    And user of browser1 sees a settings dropdown menu for "share1" item on the shares list
    And user of browser1 clicks on the "RENAME" item in current settings dropdown
    And user of browser1 sees that "Rename share" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "helloworld" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees that modal has disappeared

    And user of browser1 sees that "share1" has been renamed to "helloworld"
    And user of browser1 selects "helloworld" from shares list
    And user of browser1 sees that selected share is named "helloworld"

    And user of browser2 refreshes site
    And user of browser2 sees that public share is named "helloworld"

    And user of browser1 clicks a settings icon displayed for "helloworld" item on the shares list
    And user of browser1 sees a settings dropdown menu for "helloworld" item on the shares list
    And user of browser1 clicks on the "REMOVE" item in current settings dropdown
    And user of browser1 sees that "Remove share" modal has appeared
    And user of browser1 clicks "Yes" confirmation button in displayed modal
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that share named "helloworld" has disappeared from the shares list

    And user of browser2 refreshes site
    And user of browser2 sees that he no longer has access to the share

    # TODO rm after integrating with swagger
    Then user of browser1 clicks on the "data" tab in main menu sidebar
    And user of browser1 uses spaces select to change data space to "Small space"
    And user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 selects dir1 from files list
    And user of browser1 clicks the button from top menu bar with tooltip "Remove element"
    And user of browser1 sees that "Remove files" modal has appeared
    And user of browser1 clicks "OK" confirmation button in displayed modal
    And user of browser1 sees an success notify with text matching to: .*removed.*
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir1 directory has disappeared from file list


  Scenario: User sees new files in public share view after adding them to shared directory
    When user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 clicks the button from top menu bar with tooltip "Create directory"
    And user of browser1 sees that "New directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "dir1" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir1 directory has appeared in file list

    And user of browser1 double clicks on directory dir1 from files list
    And user of browser1 uses upload button in toolbar to upload file "20B-0.txt" to current dir
    And user of browser1 sees an info notify with text matching to: .*20B-0\.txt.*uploaded successfully.*
    And user of browser1 sees that 20B-0.txt file has appeared in file list

    And user of browser1 clicks the button from top menu bar with tooltip "Create directory"
    And user of browser1 sees that "New directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "dir2" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir2 directory has appeared in file list

    And user of browser1 double clicks on directory dir2 from files list
    And user of browser1 uses upload button in toolbar to upload file "20B-1.txt" to current dir
    And user of browser1 sees an info notify with text matching to: .*20B-1\.txt.*uploaded successfully.*
    And user of browser1 sees that 20B-1.txt file has appeared in file list

    And user of browser1 uses spaces select to change data space to "Small space"
    And user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 selects dir1 from files list
    And user of browser1 clicks the button from top menu bar with tooltip "Share element"

    And user of browser1 sees that "Share the directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "share1" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees an info notify with text matching to: Share created sucessfully
    And user of browser1 sees that modal has disappeared

    And user of browser1 sees that "Share summary" modal has appeared
    And user of browser1 clicks on copy button in active modal
    And user of browser1 sends copied url to users of [browser2]
    And user of browser1 clicks "Close" confirmation button in displayed modal
    And user of browser1 sees that modal has disappeared

    And user of browser2 opens received url
    And user of browser2 sees that url matches https?://[^/]*/#/public/shares/.*
    And user of browser2 sees that public share is named "share1"
    And user of browser2 sees that current working directory is share1
    And user of browser2 double clicks on directory dir1 from files list
    And user of browser2 sees that current working directory is share1/dir1
    And user of browser2 does not see file2 file in file list

    And user of browser1 double clicks on directory dir1 from files list
    And user of browser1 clicks the button from top menu bar with tooltip "Create file"
    And user of browser1 sees that "New file" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "file2" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that file2 file has appeared in file list

    And user of browser2 refreshes site
    And user of browser2 sees that current working directory is share1
    And user of browser2 double clicks on directory dir1 from files list
    And user of browser2 sees that current working directory is share1/dir1
    And user of browser2 sees that file2 file has appeared in file list

    # TODO rm after integrating with swagger
    Then user of browser1 clicks on the "data" tab in main menu sidebar
    And user of browser1 uses spaces select to change data space to "Small space"
    And user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 selects dir1 from files list
    And user of browser1 clicks the button from top menu bar with tooltip "Remove element"
    And user of browser1 sees that "Remove files" modal has appeared
    And user of browser1 clicks "OK" confirmation button in displayed modal
    And user of browser1 sees an success notify with text matching to: .*removed.*
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir1 shared-directory has disappeared from file list


  Scenario: User does not see file in public share view after removing them from shared directory
    When user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 clicks the button from top menu bar with tooltip "Create directory"
    And user of browser1 sees that "New directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "dir1" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir1 directory has appeared in file list

    And user of browser1 double clicks on directory dir1 from files list
    And user of browser1 uses upload button in toolbar to upload file "20B-0.txt" to current dir
    And user of browser1 sees an info notify with text matching to: .*20B-0\.txt.*uploaded successfully.*
    And user of browser1 sees that 20B-0.txt file has appeared in file list

    And user of browser1 clicks the button from top menu bar with tooltip "Create directory"
    And user of browser1 sees that "New directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "dir2" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir2 directory has appeared in file list

    And user of browser1 double clicks on directory dir2 from files list
    And user of browser1 uses upload button in toolbar to upload file "20B-1.txt" to current dir
    And user of browser1 sees an info notify with text matching to: .*20B-1\.txt.*uploaded successfully.*
    And user of browser1 sees that 20B-1.txt file has appeared in file list

    And user of browser1 uses spaces select to change data space to "Small space"
    And user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 selects dir1 from files list
    And user of browser1 clicks the button from top menu bar with tooltip "Share element"

    And user of browser1 sees that "Share the directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "share1" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees an info notify with text matching to: Share created sucessfully
    And user of browser1 sees that modal has disappeared

    And user of browser1 sees that "Share summary" modal has appeared
    And user of browser1 clicks on copy button in active modal
    And user of browser1 sends copied url to users of [browser2]
    And user of browser1 clicks "Close" confirmation button in displayed modal
    And user of browser1 sees that modal has disappeared

    And user of browser2 opens received url
    And user of browser2 sees that url matches https?://[^/]*/#/public/shares/.*
    And user of browser2 sees that public share is named "share1"
    And user of browser2 sees that current working directory is share1
    And user of browser2 double clicks on directory dir1 from files list
    And user of browser2 sees that current working directory is share1/dir1
    And user of browser2 sees 20B-0.txt file in file list

    And user of browser1 double clicks on directory dir1 from files list
    And user of browser1 selects 20B-0.txt from files list
    And user of browser1 clicks the button from top menu bar with tooltip "Remove element"
    And user of browser1 sees that "Remove files" modal has appeared
    And user of browser1 clicks "OK" confirmation button in displayed modal
    And user of browser1 sees an success notify with text matching to: .*removed.*
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that 20B-0.txt file has disappeared from file list

    And user of browser2 refreshes site
    And user of browser2 sees that current working directory is share1
    And user of browser2 double clicks on directory dir1 from files list
    And user of browser2 sees that current working directory is share1/dir1
    And user of browser2 sees that file2 file has disappeared from file list

    # TODO rm after integrating with swagger
    Then user of browser1 clicks on the "data" tab in main menu sidebar
    And user of browser1 uses spaces select to change data space to "Small space"
    And user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 selects dir1 from files list
    And user of browser1 clicks the button from top menu bar with tooltip "Remove element"
    And user of browser1 sees that "Remove files" modal has appeared
    And user of browser1 clicks "OK" confirmation button in displayed modal
    And user of browser1 sees an success notify with text matching to: .*removed.*
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir1 shared-directory has disappeared from file list


  Scenario: User can jump from inner dir to outer one in public share view
    When user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 clicks the button from top menu bar with tooltip "Create directory"
    And user of browser1 sees that "New directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "dir1" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir1 directory has appeared in file list

    And user of browser1 double clicks on directory dir1 from files list
    And user of browser1 uses upload button in toolbar to upload file "20B-0.txt" to current dir
    And user of browser1 sees an info notify with text matching to: .*20B-0\.txt.*uploaded successfully.*
    And user of browser1 sees that 20B-0.txt file has appeared in file list

    And user of browser1 clicks the button from top menu bar with tooltip "Create directory"
    And user of browser1 sees that "New directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "dir2" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir2 directory has appeared in file list

    And user of browser1 double clicks on directory dir2 from files list
    And user of browser1 uses upload button in toolbar to upload file "20B-1.txt" to current dir
    And user of browser1 sees an info notify with text matching to: .*20B-1\.txt.*uploaded successfully.*
    And user of browser1 sees that 20B-1.txt file has appeared in file list

    And user of browser1 uses spaces select to change data space to "Small space"
    And user of browser1 uses spaces select to change data space to "space1"
    And user of browser1 selects dir1 from files list
    And user of browser1 clicks the button from top menu bar with tooltip "Share element"

    And user of browser1 sees that "Share the directory" modal has appeared
    And user of browser1 clicks on input box in active modal
    And user of browser1 types "share1" on keyboard
    And user of browser1 presses enter on keyboard
    And user of browser1 sees an info notify with text matching to: Share created sucessfully
    And user of browser1 sees that modal has disappeared

    And user of browser1 sees that "Share summary" modal has appeared
    And user of browser1 clicks on copy button in active modal
    And user of browser1 sends copied url to users of [browser2]
    And user of browser1 clicks "Close" confirmation button in displayed modal
    And user of browser1 sees that modal has disappeared

    And user of browser2 opens received url
    And user of browser2 sees that url matches https?://[^/]*/#/public/shares/.*
    And user of browser2 sees that public share is named "share1"
    And user of browser2 sees that current working directory is share1
    And user of browser2 double clicks on directory dir1 from files list
    And user of browser2 sees that current working directory is share1/dir1
    And user of browser2 sees 20B-0.txt file in file list
    And user of browser2 double clicks on directory dir2 from files list
    And user of browser2 sees that current working directory is share1/dir1/dir2
    And user of browser2 sees 20B-1.txt file in file list
    And user of browser2 clicks on share1/dir1 using breadcrumbs from file browser
    And user of browser2 sees that current working directory is share1/dir1
    And user of browser2 sees 20B-0.txt file in file list

    # TODO rm after integrating with swagger
    Then user of browser1 selects dir1 from files list
    And user of browser1 clicks the button from top menu bar with tooltip "Remove element"
    And user of browser1 sees that "Remove files" modal has appeared
    And user of browser1 clicks "OK" confirmation button in displayed modal
    And user of browser1 sees an success notify with text matching to: .*removed.*
    And user of browser1 sees that modal has disappeared
    And user of browser1 sees that dir1 shared-directory has disappeared from file list