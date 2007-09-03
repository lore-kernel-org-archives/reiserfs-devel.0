From: "Rob Mueller" <robm@fastmail.fm>
Subject: BUG: at fs/reiserfs/inode.c:2868 reiserfs_releasepage()
Date: Mon, 3 Sep 2007 16:47:07 +1000
Message-ID: <1d7601c7edf6$40655930$8700a8c0@robmhp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: reiserfs-devel@vger.kernel.org

We're seeing the above error repeated numerous times in our dmesg log, 
though it doesn't seem to be causing any major problems. The full message 
is:

BUG: at fs/reiserfs/inode.c:2868 reiserfs_releasepage()
 [<c0199ecb>] reiserfs_releasepage+0xa3/0xa8
 [<c0199e28>] reiserfs_releasepage+0x0/0xa8
 [<c013c8e9>] try_to_release_page+0x2c/0x40
 [<c0141386>] pagevec_strip+0x52/0x54
 [<c0142027>] shrink_active_list+0x347/0x3d1
 [<c0142b33>] shrink_zone+0xd8/0xf5
 [<c014307c>] kswapd+0x322/0x423
 [<c012b4e4>] autoremove_wake_function+0x0/0x37
 [<c0142d5a>] kswapd+0x0/0x423
 [<c012b362>] kthread+0xae/0xd3
 [<c012b2b4>] kthread+0x0/0xd3
 [<c010383b>] kernel_thread_helper+0x7/0x1c
 =======================

$ uptime
 02:45:06 up 38 days, 23:53,  1 user,  load average: 1.47, 1.35, 1.78
$ dmesg | grep BUG: | grep releasepage | wc -l
226

This is linux 2.6.20.11 with one patch applied to work around this bug 
http://lists.linuxcoding.com/kernel/2006-q1/msg32508.html, the patch is:

-----
--- linux/fs/reiserfs/file.c   2006-11-29 16:57:37.000000000 -0500
+++ linux-syncwrite/fs/reiserfs/file.c 2007-02-02 01:01:36.000000000 -0500
@@ -1358,6 +1358,8 @@
                return result;
        }

+       return do_sync_write(file, buf, count, ppos);
+
        if (unlikely((ssize_t) count < 0))
                return -EINVAL;
------

Any idea what's causing this?

Rob

