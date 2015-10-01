Feature: Directory_stat

  Background:
    Given environment is defined in env.json
    And environment is up
    And [u1, u2] start oneclients [client1, client2] in
      [/root/onedata1, /root/onedata2] on nodes [1, 2] respectively,
      using [token, token]

  Scenario: Check file type
    When u1 creates directories [dir1] on client1
    Then u2 checks if dir1 file type is directory on client2

  Scenario: Check default access permissions
    When u1 creates directories [dir1] on client1
    Then u2 checks if dir1 mode is 755 on client2

  Scenario: Change access permissions
    When u1 creates directories [dir1] on client1
    And u1 changes dir1 mode to 211 on client1
    Then u2 checks if dir1 mode is 211 on client2

  Scenario: Timestamps at creation
    When u1 creates directories [dir1] on client1
    Then u2 checks if modification time of dir1 is equal to access time on client2
    And u2 checks if status-change time of dir1 is equal to access time on client2

  Scenario: Update timestamps
    When u1 creates directories [dir1] on client1
    And u1 waits 1 seconds on client1
    And u1 creates directories [dir1/dir2] on client1
    And u1 updates [dir1] timestamps on client1
    # aim of above step is to call touch on dir1
    # after creation of subdir access time and
    # modification time were different
    # after touch both will be updated to current time
    Then u2 checks if modification time of dir1 is equal to access time on client2

  Scenario: Access time
    When u1 creates directories [dir1] on client1
    And u1 waits 1 seconds on client1
    Then u1 doesn't see [dir] in dir1 on client1
    #aim of above step is to call ls
    And u2 checks if access time of dir1 is greater than modification time on client2
    And u2 checks if access time of dir1 is greater than status-change time on client2

  Scenario: Modification time
    When u1 creates directories [dir1] on client1
    And u1 waits 1 seconds on client1
    # call sleep, to be sure that time of above and below operations is different
    And u1 creates directories [dir1/dir2] on client1
    Then u2 checks if modification time of dir1 is greater than access time on client2
    And u2 checks if modification time of dir1 is equal to status-change time on client2

  Scenario: Status-change time when renaming
    When u1 creates directories [dir1] on client1
    When u1 waits 1 seconds on client1
    # call sleep, to be sure that time of above and below operations is different
    When u1 renames dir1 to dir2 on client1
    Then u2 checks if status-change time of dir2 is greater than modification time on client2
    Then u2 checks if status-change time of dir2 is greater than access time on client2

  Scenario: Status-change time when changing mode
    When u1 creates directories [dir1] on client1
    When u1 waits 1 seconds on client1
    # call sleep, to be sure that time of above and below operations is different
    When u1 changes dir1 mode to 211 on client1
    Then u2 checks if status-change time of dir1 is greater than modification time on client2
    Then u2 checks if status-change time of dir1 is greater than access time on client2