From: Timo Kokkonen <kaapeli@ee.oulu.fi>
Subject: Reproducible reiser4 bug with 2.6.16.2 patch on tail_conversion.c:80
Date: Wed, 10 May 2006 13:56:20 +0300
Message-ID: <4461C6D4.9050705@ee.oulu.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-28600-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

I was able to produce this bug on two different computers running the
same kernel version and same patches and same task. Each time I run
dispatch-conf (I'm running on gentoo) to update the config files on
/etc, it gives the following output:

RCS file: /etc/config-archive/usr/lib/X11/xkb/xkbcomp,v
1.1 locked
ci: RCS file /etc/config-archive/usr/lib/X11/xkb/xkbcomp,v is in use
/etc/config-archive/usr/lib/X11/xkb/xkbcomp,v  -->
/etc/config-archive/usr/lib/X11/xkb/xkbcomp
revision 1.1.1.1
writable /etc/config-archive/usr/lib/X11/xkb/xkbcomp exists; remove it?
[ny](n):


And right after that I can see this message in kernel log:

May 10 11:26:32 kaatokone2 [4296234.613000] ------------[ cut here 
]------------
May 10 11:26:32 kaatokone2 [4296234.613000] kernel BUG at 
fs/reiser4/plugin/file/tail_conversion.c:80!
May 10 11:26:32 kaatokone2 [4296234.613000] invalid opcode: 0000 [#1]
May 10 11:26:32 kaatokone2 [4296234.613000] PREEMPT
May 10 11:26:32 kaatokone2 [4296234.613000] Modules linked in: w83627hf 
w83781d hwmon_vid eeprom i2c_isa
May 10 11:26:32 kaatokone2 [4296234.613000] CPU:    0
May 10 11:26:32 kaatokone2 [4296234.613000] EIP:    0060:[<b019ec1f>] 
  Not tainted VLI
May 10 11:26:32 kaatokone2 [4296234.613000] EFLAGS: 00210286 
(2.6.16-gentoo-r7 #1)
May 10 11:26:32 kaatokone2 [4296234.613000] EIP is at 
get_nonexclusive_access+0x23/0x36
May 10 11:26:32 kaatokone2 [4296234.613000] eax: ef7644c4   ebx: 
00000000   ecx: a7e8b000   edx: e5d0c414
May 10 11:26:32 kaatokone2 [4296234.613000] esi: e5d0c414   edi: 
e5d0c46c   ebp: e5d59e9c   esp: e5d59dc4
May 10 11:26:32 kaatokone2 [4296234.613000] ds: 007b   es: 007b   ss: 0068
May 10 11:26:32 kaatokone2 [4296234.613000] Process rcs (pid: 8422, 
threadinfo=e5d58000 task=e5cf2ab0)
May 10 11:26:32 kaatokone2 [4296234.613000] Stack: <0>b01b18e9 e5d0c414 
00000000 00000000 34000000 e5d58000 b16ba260 00000000
May 10 11:26:32 kaatokone2 [4296234.613000]        e5eb8780 b01b1ccd 
e5d0c46c e5d59e9c eed8e8c0 eed8e8d0 eed8e8d0 00000002
May 10 11:26:32 kaatokone2 [4296234.613000]        00000001 e5d59e9c 
00001000 00000001 efeea800 efded414 00391f78 00000000
May 10 11:26:32 kaatokone2 [4296234.613000] Call Trace:
May 10 11:26:32 kaatokone2 [4296234.613000]  [<b01b18e9>] 
extent_balance_dirty_pages+0x13a/0x145
May 10 11:26:32 kaatokone2 [4296234.613000]  [<b01b1ccd>] 
extent_write_flow+0x3d9/0x4e7
May 10 11:26:32 kaatokone2 [4296234.613000]  [<b01b1f0a>] 
write_extent+0x0/0x36
May 10 11:26:32 kaatokone2 [4296234.613000]  [<b019dc17>] 
append_and_or_overwrite+0x24f/0x2fd
May 10 11:26:32 kaatokone2 [4296234.613000]  [<b019dd0c>] 
write_flow+0x47/0x50
May 10 11:26:32 kaatokone2 [4296234.613000]  [<b019de92>] 
write_file+0x5c/0x7a
May 10 11:26:32 kaatokone2 [4296234.613000]  [<b019e177>] 
write_unix_file+0x2c7/0x444
May 10 11:26:32 kaatokone2 [4296234.613000]  [<b014bd9e>] 
vfs_write+0x87/0x11b
May 10 11:26:32 kaatokone2 [4296234.613000]  [<b014bed0>] 
sys_write+0x3b/0x63
May 10 11:26:32 kaatokone2 [4296234.613000]  [<b0102a93>] 
sysenter_past_esp+0x54/0x75
May 10 11:26:32 kaatokone2 [4296234.613000] Code: 0f 85 b5 0d 00 00 c3 
c3 83 7c 24 08 00 8b 54 24 04 75 20 b8 00 e0 ff ff 21 e0 8b 00 8b 80 b4 
04 00 00 8b 40 40 83 78 08 00 74 08 <0f> 0b 50 00 ba cf 43 b0 89 d0 ff 
00 0f 88 92 0d 00 00 c3 8b 54
May 10 11:26:32 kaatokone2 [4296234.613000]  <4><4>reiser4[rcs(8422)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
May 10 11:26:32 kaatokone2 [4296234.614000] WARNING: out of memory?
May 10 11:26:32 kaatokone2 [4296234.614000] <4>reiser4[rcs(8422)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
May 10 11:26:32 kaatokone2 [4296234.614000] WARNING: out of memory?
May 10 11:26:32 kaatokone2 [4296234.614000] <4>reiser4[rcs(8422)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
May 10 11:26:32 kaatokone2 [4296234.614000] WARNING: out of memory?
May 10 11:26:32 kaatokone2 [4296234.614000] <4>reiser4[rcs(8422)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
May 10 11:26:32 kaatokone2 [4296234.614000] WARNING: out of memory?
May 10 11:26:32 kaatokone2 [4296234.614000] <4>reiser4[rcs(8422)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
May 10 11:26:32 kaatokone2 [4296234.614000] WARNING: out of memory?


After a reboot and running dispatch-conf again I get the exact same 
error message again. I got this same bug on the another computer aswell, 
during exact same conditions (running dispatch-conf, it even complained 
about the same filename). Running reiser4.fsck didn't reveal any 
problems at all on that computer. Booting with 2.6.15.1 (with 
gentoo-sources-2.6.15-r1 patches) and reiser4-2.6.15.1 didn't crash and 
dispatch-conf finished updating the files normally.

So, now I have this computer that I can make to crash every time by 
running dispatch-conf. I can keep the computer intact and run further 
diagnostics on it, if necessary. If there is any other info you need to 
know, let me know what you want and I try to provide the info you need 
to get this solved.


Timo Kokkonen
