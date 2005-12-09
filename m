From: Hajime SAITO <h.saito@generalrobotix.com>
Subject: Anyone tried reiser4 on TP T43p?
Date: Sat, 10 Dec 2005 06:42:21 +0900
Message-ID: <4399FA3D.2000500@generalrobotix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27242-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

I am trying to get a working reiser4 partition on a thinkpad T43p. I
have only succeeded in getting it to work once. All the other times I
get the following. Actually this is all I can see on the screen.

---------------------
[<c01751b8>] sys_rename+0x1c8/0x1f0
[<c0153d6c>] __handle_mm_fault+0x16c/0x1f0
[<c01030a7>] sysenter_past_esp+0x54/0x75
Code: 15 c4 cc 3c c0 eb d0 8d b4 26 00 00 00 00 8d bc 27 00 00 00 00 56
53 89 c3 83 ec 04 e8 84 76 fe ff 8b 83 c8 00 00 00 85 c0 74 08 <0f> 0b
fc 00 e6 37 38 c0 8b 83 2c 01 00 00 a8 10 75 08 0f 0b fe
<4><4>reiser4[mv(3888)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2733)[vs-44]:
WARNING: out of memory?
<4>reiser4[mv(3888)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2733)[vs-44]:
WARNING: out of memory?
<4>reiser4[mv(3888)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2733)[vs-44]:
WARNING: out of memory?
<4>reiser4[mv(3888)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2733)[vs-44]:
WARNING: out of memory?
<4>reiser4[mv(3888)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2733)[vs-44]:
WARNING: out of memory?
[ ok ]
* Starting portmap daemon... [ ok ]
/etc/rcS.d/S43portmap: line 20: sleep: command not found

-----------------------
then silence.

I am using 2.4.14.3 + reiser4-for-2.6.14-1.patch.gz and I have reiser4
compiled into the kernel(not as a module). The base system is ubuntu and
I used gcc-4.0 to compile the kernel itself. I have tried removing all
the risky options I put in the kernel but to no avail.

Anyone have suggestions for things I can try?

Thanks in advance,

Hajime

