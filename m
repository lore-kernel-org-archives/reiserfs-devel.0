From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 207717] New: reiserfs: data race on inode->i_size in
 reiserfs_write_full_page()
Date: Wed, 13 May 2020 03:28:02 +0000
Message-ID: <bug-207717-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207717

            Bug ID: 207717
           Summary: reiserfs: data race on inode->i_size in
                    reiserfs_write_full_page()
           Product: File System
           Version: 2.5
    Kernel Version: 5.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: baijiaju1990@gmail.com
        Regression: No

The functions reiserfs_write_full_page() and reiserfs_write_end() are
concurrently executed at runtime in the following call contexts:

Thread 1:
reiserfs_writepage()
  reiserfs_write_full_page()

Thread 2:
reiserfs_write_end()

In reiserfs_write_full_page():
  unsigned long end_index = inode->i_size >> PAGE_SHIFT;

In reiserfs_write_end():
  inode->i_size = pos + copied;

Thus, a data race on inode->i_size occurs.

This data race was found and actually reproduced by our concurrency fuzzer.

I am not sure whether this data race is harmful and how to fix this data race
properly, so I want to listen to your opinions, thanks :)

-- 
You are receiving this mail because:
You are the assignee for the bug.
