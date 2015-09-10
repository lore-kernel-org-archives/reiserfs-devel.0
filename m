From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 104391] New: Use-after-free errors in reiserfsprogs (mkreiserfs
 / reiserfsck)
Date: Thu, 10 Sep 2015 13:20:59 +0000
Message-ID: <bug-104391-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=104391

            Bug ID: 104391
           Summary: Use-after-free errors in reiserfsprogs (mkreiserfs /
                    reiserfsck)
           Product: File System
           Version: 2.5
    Kernel Version: 4.2.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: hanno@hboeck.de
        Regression: No

The reiserfsprogs have use-after-free errors (even on normal operation).

When I compile reiserfsprogs with address sanitizer (adding
"-fsanitize=address" to CFLAGS/LDFLAGS) and run mkreiserfs I get this:

==31481==ERROR: AddressSanitizer: heap-use-after-free on address 0x60d00000cf98
at pc 0x48e705 bp 0x7ffdd4eeeda0 sp 0x7ffdd4eeed90
READ of size 4 at 0x60d00000cf98 thread T0
    #0 0x48e704 in reiserfs_close
/f/reiser/reiserfsprogs-3.6.24/reiserfscore/reiserfslib.c:419
    #1 0x4070a6 in main
/f/reiser/reiserfsprogs-3.6.24/mkreiserfs/mkreiserfs.c:785
    #2 0x7f4a4c899f9f in __libc_start_main (/lib64/libc.so.6+0x1ff9f)
    #3 0x40b0b1 (/f/reiser/reiserfsprogs-3.6.24/mkreiserfs/mkreiserfs+0x40b0b1)

0x60d00000cf98 is located 40 bytes inside of 144-byte region
[0x60d00000cf70,0x60d00000d000)
freed by thread T0 here:
    #0 0x7f4a4ce7347f in __interceptor_free
(/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.2/libasan.so.1+0x5747f)
    #1 0x48e50b in reiserfs_free
/f/reiser/reiserfsprogs-3.6.24/reiserfscore/reiserfslib.c:407
    #2 0x48e50b in reiserfs_close
/f/reiser/reiserfsprogs-3.6.24/reiserfscore/reiserfslib.c:418

previously allocated by thread T0 here:
    #0 0x7f4a4ce736f7 in malloc
(/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.2/libasan.so.1+0x576f7)
    #1 0x4c6f7c in mem_alloc /f/reiser/reiserfsprogs-3.6.24/lib/misc.c:110
    #2 0x4c6f7c in getmem /f/reiser/reiserfsprogs-3.6.24/lib/misc.c:97


Same with reiserfsck (on a previously newly created reiserfs image):
==4684==ERROR: AddressSanitizer: heap-use-after-free on address 0x60d00000cf98
at pc 0x541855 bp 0x7ffc99c55540 sp 0x7ffc99c55530
READ of size 4 at 0x60d00000cf98 thread T0
    #0 0x541854 in reiserfs_close
/f/reiser/reiserfsprogs-3.6.24/reiserfscore/reiserfslib.c:419
    #1 0x4077c4 in check_fs /f/reiser/reiserfsprogs-3.6.24/fsck/main.c:1156
    #2 0x4077c4 in main /f/reiser/reiserfsprogs-3.6.24/fsck/main.c:1356
    #3 0x7f46ec29df9f in __libc_start_main (/lib64/libc.so.6+0x1ff9f)
    #4 0x411251 (/f/reiser/reiserfsprogs-3.6.24/fsck/reiserfsck+0x411251)

0x60d00000cf98 is located 40 bytes inside of 144-byte region
[0x60d00000cf70,0x60d00000d000)
freed by thread T0 here:
    #0 0x7f46ec87747f in __interceptor_free
(/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.2/libasan.so.1+0x5747f)
    #1 0x54165b in reiserfs_free
/f/reiser/reiserfsprogs-3.6.24/reiserfscore/reiserfslib.c:407
    #2 0x54165b in reiserfs_close
/f/reiser/reiserfsprogs-3.6.24/reiserfscore/reiserfslib.c:418

previously allocated by thread T0 here:
    #0 0x7f46ec8776f7 in malloc
(/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.2/libasan.so.1+0x576f7)
    #1 0x57a0cc in mem_alloc /f/reiser/reiserfsprogs-3.6.24/lib/misc.c:110
    #2 0x57a0cc in getmem /f/reiser/reiserfsprogs-3.6.24/lib/misc.c:97

-- 
You are receiving this mail because:
You are the assignee for the bug.
