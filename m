From: Vince <fuzzy77@free.fr>
Subject: Re: Snapshot against 2.6.1 released.
Date: Thu, 22 Jan 2004 18:14:07 +0100
Message-ID: <401004DF.7080100@free.fr>
References: <16396.11375.115895.934750@laputa.namesys.com>	<20040120080223.2921.qmail@web21505.mail.yahoo.com> <16396.64924.478222.923131@laputa.namesys.com> <400DAC72.1060502@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040308090809070001090305"
Return-path: <reiserfs-list-return-16606-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <400DAC72.1060502@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------040308090809070001090305
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


> Nikita Danilov wrote:

>> My apology for everyone for missing this bit in the READ.ME:
>>
>> you have to re-create your file-systems with mkfs supplied with this
>> snapshot.
>>

I wrote:
> Is it really mandatory to re-create or will a "fsck.reiser4 --build-fs" 
> be able to fix the filesystem to the new format ? 
> 

(replying to myself) It seems indeed really mandatory... I got a kernel 
oops while fsck-ing my old reiser4 partition with the new 
kernel+userspace snapshot (kernel is 2.6.2-rc1-mm1, reiser4 snapshot is 
2004.01.19.fixed). And now the (unfixed/corrupted) partition causes the 
following oops when I try to mount it:

reiser4[mount(177)]: get_ready_format40 
(fs/reiser4/plugin/disk_format/disk_format40.c:248)[nikita-3228]:
WARNING: Key format mismatch. Only large keys are supported.
Unable to handle kernel NULL pointer dereference at virtual address 00000000
  printing eip:
c01b762d
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
CPU:    0
EIP:    0060:[<c01b762d>]    Not tainted VLI
EFLAGS: 00010246
EIP is at unhash_unformatted_node_nolock+0x1d/0x70
eax: 00000000   ebx: decea7c0   ecx: 00000000   edx: 00000000
esi: dfde6000   edi: 00000000   ebp: c14d0418   esp: dfde7c38
ds: 007b   es: 007b   ss: 0068
Process mount (pid: 177, threadinfo=dfde6000 task=dfdfe6b0)
Stack: dfde6000 dfde6000 c01b769d decea7c0 decea7c0 c01d9437 decea7c0 
decea7c0
        00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
        00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
Call Trace:
  [<c01b769d>] unhash_unformatted_jnode+0x1d/0x40
  [<c01d9437>] reiser4_invalidatepage+0xd7/0x160
  [<c0143ba7>] do_invalidatepage+0x27/0x30
  [<c0143c2b>] truncate_complete_page+0x7b/0x80
  [<c0143e00>] truncate_inode_pages+0x100/0x3c0
  [<c01704ef>] wake_up_inode+0xf/0x30
  [<c01769bb>] write_inode_now+0x4b/0x90
  [<c017000b>] generic_forget_inode+0x14b/0x180
  [<c01700c2>] iput+0x62/0x80
  [<c01cf6b9>] done_formatted_fake+0x59/0x80
  [<c01ddabe>] done_super+0x1e/0x30
  [<c01ddb3a>] reiser4_fill_super+0x6a/0x70
  [<c015d314>] get_sb_bdev+0x124/0x160
  [<c01d712f>] reiser4_get_sb+0x2f/0x40
  [<c01ddad0>] reiser4_fill_super+0x0/0x70
  [<c015d57f>] do_kern_mount+0x5f/0xe0
  [<c0172e08>] do_add_mount+0x78/0x150
  [<c01730f4>] do_mount+0x124/0x170
  [<c0172f60>] copy_mount_options+0x80/0xf0
  [<c01734af>] sys_mount+0xbf/0x140
  [<c02f5ebe>] sysenter_past_esp+0x43/0x65

Code: e9 69 fe ff ff 89 f6 8d bc 27 00 00 00 00 53 83 ec 04 8b 5c 24 0c 
8b 4b 28 8b 53 14 03 53 0c 8b 41 40 48 21 c2 8b 41 3c 8d 0c 90 <8b> 01 
85 c0 74 14 8d 50 1c 0f 18 02 90 39 d8 74 32 8b 40 1c 89
  <6>note: mount[177] exited with preempt_count 2

I also attach the output of debugfs.reiser4 -t in case it could help 
(this is still a bug that mounting a corrupted partition can cause a 
kernel oops)...

--------------040308090809070001090305
Content-Type: text/plain;
 name="debugfs.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="debugfs.log"

NODE (22) LEVEL=2 ITEMS=2 SPACE=3976 MKFS ID=0x32cfc610 FLUSH=0x0
#0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF 28, LEN=8, flags=0x0 UNITS=1
[23]
------------------------------------------------------------------------------
#1  NPTR (nodeptr40): [2a:4(FB):74657374000000:10000:e50] OFF 36, LEN=8, flags=0x0 UNITS=1
[26]
==============================================================================
NODE (23) LEVEL=1 ITEMS=4 SPACE=0 MKFS ID=0x32cfc610 FLUSH=0x0
#0  SD (stat40): [29:1(SD):0:2a:0] OFF 28, LEN=44, flags=0x0 UNITS=1
exts:		2
mask:		0x3
plugin:		sdext_lw
offset:		2
len:		14
mode:		drwxr-xr-x
nlink:		3
size:		3
plugin:		sdext_unix
offset:		16
len:		28
uid:		0
gid:		0
atime:		Sun Jan 18 23:08:41 2004
mtime:		Sun Jan 18 23:09:34 2004
ctime:		Sun Jan 18 23:09:34 2004
rdev:		150
bytes:		150
------------------------------------------------------------------------------
#1  DENTRY (cde40): [2a:0(NAME):0:0:0] OFF 72, LEN=152, flags=0x0 UNITS=3
NR  NAME              OFFSET HASH                              SDKEY             
  0 .                     80 0000000000000000:0000000000000000 0000291:000002a
  1 ..                   104 0000000000000000:0000000000000000 0000291:000002a
  2 test                 128 0000000000000000:0000000000000000 00002a1:0010000
------------------------------------------------------------------------------
#2  SD (stat40): [2a:1(SD):74657374000000:10000:0] OFF 224, LEN=56, flags=0x0 UNITS=1
exts:		3
mask:		0x7
plugin:		sdext_lw
offset:		2
len:		14
mode:		-rw-r--r--
nlink:		1
size:		6120
plugin:		sdext_unix
offset:		16
len:		28
uid:		0
gid:		0
atime:		Sun Jan 18 23:09:34 2004
mtime:		Sun Jan 18 23:10:35 2004
ctime:		Sun Jan 18 23:10:35 2004
rdev:		12240
bytes:		12240
plugin:		sdext_lt
offset:		44
len:		12
atime:		461999488
mtime:		253757736
ctime:		253757736
------------------------------------------------------------------------------
#3  TAIL (tail40): [2a:4(FB):74657374000000:10000:0] OFF 280, LEN=3664, flags=0x0 
==============================================================================
NODE (26) LEVEL=1 ITEMS=1 SPACE=1574 MKFS ID=0x32cfc610 FLUSH=0x0
#0  TAIL (tail40): [2a:4(FB):74657374000000:10000:e50] OFF 28, LEN=2456, flags=0x0 
==============================================================================


--------------040308090809070001090305--
