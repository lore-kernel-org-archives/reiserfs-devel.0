From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [xfstests/generic/275] dd blocked for hours with no IO with reg40
Date: Sun, 22 Nov 2015 10:34:50 +0100
Message-ID: <CADW=+3kaDpcHvbNmSn7YH7ir2Q_KBBbkbgX9mk-OSxSDP5w++A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=jSDwkTwGIGx81s5DjFpQEAf3pOnP7Cjwdi+lhzxcTHk=;
        b=xZxnxCRJ9nVlUllaSMIRdYc/CvbcTd4ZylOhL3XZH6d3WlU7nFm89ewmNqGmb5ybg+
         +Tag4DjFIoNbimDDFBNB4lYLMywH5TY/6pKpy2OpVtTpHWbU5KfOcxxEJTgzSr2yF0bs
         o0qlf+1URbhye8x7IFdj61XW4DC1dgpp7fcejDNIdyQjPRfHFw2XPe2yRJe5inYOPYnU
         At9QbrmfVly8oj4S1xZLllWarf4YnwLXpn18qUMfIdChzrU+8MowvWM12o/WESTKykOj
         sy1eHYIAT6rHdQhipIXi43/G0i9//ZsuX91NwtYxlr9pflWi3ZlS4XBlfe3fkrUHw/Fh
         cC5Q==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Kernel: linux 4.3
R4 patch: 4.3.0
test: xfstests/generic/275 "The posix write test.  When write size is
larger than disk free size, should write as much as possible until
ENOSPC."
http://oss.sgi.com/cgi-bin/gitweb.cgi?p=xfs/cmds/xfstests.git;a=blob;f=tests/generic/275;hb=HEAD

With ccreg40 plugin it finishes after few hours but I believe it's
false positive because it never fills up the disk as test uses dd
if=/dev/zero and it's very compressible so bottleneck is CPU.
I'll try to modify the test to use some incompressible file.
With reg40 plugin it never finishes.

[r4Hybrid]
MKFS_OPTIONS="-o create=reg40"
MOUNT_OPTIONS="-o noatime"

i get loads of these:

Nov 22 10:59:09 reiser4 kernel: [ 2760.175949] INFO: task dd:22480
blocked for more than 120 seconds.
Nov 22 10:59:09 reiser4 kernel: [ 2760.176024]       Tainted: G
W       4.3.0 #2
Nov 22 10:59:09 reiser4 kernel: [ 2760.176072] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Nov 22 10:59:09 reiser4 kernel: [ 2760.176134] dd              D
c105467b     0 22480  22234 0x00000000
Nov 22 10:59:09 reiser4 kernel: [ 2760.176250]  d7b51d84 00000086
d7b51d68 c105467b 00000001 d7b51d84 c10546f3 00000000
Nov 22 10:59:09 reiser4 kernel: [ 2760.176543]  d7ba1a00 d7b52000
00000246 d7ba1a00 d7b51d90 c13bb9de d2338858 d7b51d98
Nov 22 10:59:09 reiser4 kernel: [ 2760.176835]  c13bba42 d7b51dd0
c13bc5a5 00000000 00000001 00000000 c118eff0 d233887c
Nov 22 10:59:09 reiser4 kernel: [ 2760.177127] Call Trace:
Nov 22 10:59:09 reiser4 kernel: [ 2760.177186]  [<c105467b>] ?
get_parent_ip+0xb/0x40
Nov 22 10:59:09 reiser4 kernel: [ 2760.177236]  [<c10546f3>] ?
preempt_count_add+0x43/0x90
Nov 22 10:59:09 reiser4 kernel: [ 2760.177294]  [<c13bb9de>] schedule+0x2e/0x80
Nov 22 10:59:09 reiser4 kernel: [ 2760.177342]  [<c13bba42>]
schedule_preempt_disabled+0x12/0x20
Nov 22 10:59:09 reiser4 kernel: [ 2760.177395]  [<c13bc5a5>]
mutex_lock_nested+0x125/0x370
Nov 22 10:59:09 reiser4 kernel: [ 2760.177450]  [<c118eff0>] ?
reiser4_sync_file_common+0x70/0xf0
Nov 22 10:59:09 reiser4 kernel: [ 2760.177502]  [<c118eff0>]
reiser4_sync_file_common+0x70/0xf0
Nov 22 10:59:09 reiser4 kernel: [ 2760.177554]  [<c1193a4c>]
write_unix_file+0x24c/0x550
Nov 22 10:59:09 reiser4 kernel: [ 2760.177606]  [<c11961ca>] ?
reiser4_write_dispatch+0x7a/0x290
Nov 22 10:59:09 reiser4 kernel: [ 2760.177658]  [<c1196272>]
reiser4_write_dispatch+0x122/0x290
Nov 22 10:59:09 reiser4 kernel: [ 2760.177710]  [<c1196150>] ?
setattr_dispatch_hook+0x40/0x40
Nov 22 10:59:09 reiser4 kernel: [ 2760.177765]  [<c10e49e8>]
__vfs_write+0x28/0xe0
Nov 22 10:59:09 reiser4 kernel: [ 2760.177819]  [<c105f645>] ?
percpu_down_read+0x55/0x80
Nov 22 10:59:09 reiser4 kernel: [ 2760.177869]  [<c10e75e1>] ?
__sb_start_write+0xb1/0xc0
Nov 22 10:59:09 reiser4 kernel: [ 2760.177919]  [<c10e75e1>] ?
__sb_start_write+0xb1/0xc0
Nov 22 10:59:09 reiser4 kernel: [ 2760.177968]  [<c10e4c2d>]
vfs_write+0x8d/0x190
Nov 22 10:59:09 reiser4 kernel: [ 2760.178022]  [<c10ff848>] ?
__fget_light+0x68/0x80
Nov 22 10:59:09 reiser4 kernel: [ 2760.178071]  [<c10e4e43>] SyS_write+0x53/0xc0
Nov 22 10:59:09 reiser4 kernel: [ 2760.178121]  [<c13c05b7>]
sysenter_do_call+0x12/0x12
Nov 22 10:59:09 reiser4 kernel: [ 2760.178169] INFO: lockdep is turned off.


reiser4 ~ # vmstat 1 -SM
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 0  0      4      6      5    437    0    0   623  1595  297  625  3  7 72 18  0
 0  0      4      6      5    437    0    0     0     0  259   22  0
0 100  0  0
 0  0      4      6      5    437    0    0     0     0  255   16  0
0 100  0  0
 0  0      4      6      5    437    0    0     0     0  255   10  0
0 100  0  0
 0  0      4      6      5    437    0    0     0     0  255   12  0
0 100  0  0
 0  0      4      6      5    437    0    0     0     0  255   10  0
0 100  0  0
 0  0      4      6      5    437    0    0     0     0  255   14  0
0 100  0  0
 0  0      4      6      5    437    0    0     0     0  255   14  0
0 100  0  0
 0  0      4      6      5    437    0    0     0     0  255   12  0
0 100  0  0
