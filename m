From: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Subject: reiserfs: inconsistent format in __RASSERT
Date: Mon, 16 Mar 2015 20:55:55 +0800
Message-ID: <5506D2DB.6040907@m4x.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hello,

When adding a __printf attribute to reiserfs_panic, gcc reported an
inconsistent format for __RASSERT.  This macro is currently defined in
fs/reiserfs/reiserfs.h as:

    reiserfs_panic(NULL, "assertion failure", "(" #cond ") at " \
        __FILE__ ":%i:%s: " format "\n",                        \
        in_interrupt() ? -1 : task_pid_nr(current),             \
        __LINE__, __func__ , ##args);

In the format string, the first parameter is a line number, but in the
arguments there is a PID before.  Before c3a9c2109f84 ("reiserfs: rework
reiserfs_panic") [1], the format string began with "reiserfs[%i]" [2],
which explains the PID in the arguments.

I see three possibilities:

* I missed something in my analysis and in fact the PID argument is
processed by reiserfs_panic (don't know where), or
* the PID argument is not used and should be removed, or
* the PID is useful and "[%i]" should be added somewhere in the format
string.

Which one would you prefer?

Also, I found this when building the kernel with "allmodconfig" on
x86_64.  With "defconfig" gcc does not report this error, but I guess it
is because without CONFIG_REISERFS_CHECK, __RASSERT is never used.

Regards,

Nicolas


[1]
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=c3a9c2109f84882b9b3178f6b1838d550d3df0ec
[2]
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/linux/reiserfs_fs.h?id=78b6513d2881f1a759fb9825a036d926392de084#n91
