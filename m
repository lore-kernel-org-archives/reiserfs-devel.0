From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 190071] New: The patch "reiserfs: switch to
 generic_{get,set,remove}xattr()" introduced with 4.4.27 causes kernel panic
 on root mount
Date: Sun, 11 Dec 2016 17:21:28 +0000
Message-ID: <bug-190071-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=190071

            Bug ID: 190071
           Summary: The patch "reiserfs: switch to
                    generic_{get,set,remove}xattr()" introduced with
                    4.4.27 causes kernel panic on root mount
           Product: File System
           Version: 2.5
    Kernel Version: 4.4.37
          Hardware: i386
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: t.himmelbauer@htl-leonding.ac.at
        Regression: No

The patch "reiserfs: switch to generic_{get,set,remove}xattr()"
commit be90a09bd915e417feae76d9a72c2a37dc5cf1b7 in 4.4.x-series (introduced
there with 4.4.27) causes a x86 server (tested there with vanilla kernel
4.4.37) to panic when it tries to mount the reiserfs root device (fsck didn't
find any errors and --clean-attributes didn't help either).

Reverting the patch causes the kernel to boot without any errors, but probably
there is something wrong with the generic_getxattr or xattr_resolve_name.

According to the commit it is "commit 79a628d14ec7ee9adfdc3ce04343d5ff7ec20c18
upstream".

This is the message from display when the kernel panic happened.


c158b940 f69a6744 f6030a40 f641eb8c f60da558 f683df2c c11775ef 00000000 

Call Trace 

c10cecb5 generic_getxattr+0x1c/0x3f 

c10cec99 ? xattr_resolve_name+0x46/0x46 

c11773ee get_vfs_caps_from_disk + 0x41/0xbd 

c11775ef cap_bprm_set_creds + 0x185/0x4a4 

c10bb593 prepare_binprm+0xbe/0xf1 

c10bb5e3 ? count.constprop.41 + 0x1d/0x6f 

c10bbbff do_execvat_common+0x31b/0x4f0 

c10bbde8 do_execve+0x14/0x16 

c100033c run_init_process+0x1c/0x1e 

c100034a try_to_run_init_process+0xc/0x2e 

c13d0984 kernel_init+0x74/0xb0 

c13d47c9 ret_from_kernel_thread + 0x21/0x38 

c13d0910 ? reset_init+0x64/0x64 

Code 

e5 53 8b 58 20 8b 5b 18 8b 5b 4c 85 db 74 04 ff d3 eb 02 31 c0 5b 5d c3 55 89
e5 57 56 53 51 8b 3a 89 55 b0 85 ff 74 23 8d 58 04 <8b> 00 85 c0 74 27 8b 30 89
f9 8a 16 84 d2 74 14 38 11 75 04 41 

EIP: [<c10cec66>] xattr_resolve_name+0x13/0x46 

SS:ESP 0068:f683de90 

CR2: 0000 0000 0000 0000

-- 
You are receiving this mail because:
You are the assignee for the bug.
