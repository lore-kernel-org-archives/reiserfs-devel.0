From: Nick Piggin <piggin@cyberone.com.au>
Subject: Re: Reiser4 problems
Date: Mon, 20 Oct 2003 22:06:47 +1000
Message-ID: <3F93CFD7.60808@cyberone.com.au>
References: <3F928BE3.6070201@cyberone.com.au>	<3F929B2E.3020509@namesys.com> <16275.46362.247930.879666@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15863-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16275.46362.247930.879666@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>



Nikita Danilov wrote:

>Hans Reiser writes:
> > Nick Piggin wrote:
> > 
> > > Hi Hans,
> > > Sorry to report this - I know you had said there were problems with the
> > > latest snapshot, and you almost certainly have hit this problem. I'll
>
>Surprisingly not.
>
> > > report just in case:
> > >
> > > kernel 2.6.0-test7. ext3 system drive, Reiser4 SCSI test drive. I get a
> > > lot of SCSI I/O errors moments into untarring a test image onto the new
> > > Reiser4 filesystem. Created with default options. Mounted with noatime,
> > > nodiratime. Reiserfs soon panics.
>
>Can you send us relevant parts of the system log: SCSI errors and panic?
>
>

loading reiser4 bitmap......done (117 jiffies)
SCSI error : <0 0 2 0> return code = 0x70000
end_request: I/O error, dev sda, sector 2311
SCSI error : <0 0 2 0> return code = 0x70000
end_request: I/O error, dev sda, sector 3335
SCSI error : <0 0 2 0> return code = 0x70000
end_request: I/O error, dev sda, sector 271
SCSI error : <0 0 2 0> return code = 0x70000
end_request: I/O error, dev sda, sector 1295

it continues like this for quite a while, then

SCSI error : <0 0 2 0> return code = 0x70000
end_request: I/O error, dev sda, sector 384496
SCSI error : <0 0 2 0> return code = 0x70000
end_request: I/O error, dev sda, sector 385520
SCSI error : <0 0 2 0> return code = 0x70000
end_request: I/O error, dev sda, sector 386544
SCSI error : <0 0 2 0> return code = 0x70000
end_request: I/O error, dev sda, sector 387568
SCSI error : <0 0 2 0> return code = 0x70000
end_request: I/O error, dev sda, sector 388592
reiser4[ktxnmgrd:run(510)]: reiser4_handle_error 
(fs/reiser4/vfs_ops.c:1446)[foo bar-42]:
reiser4 panicked cowardly: Filesystem error occured
 
------------[ cut here ]------------
kernel BUG at fs/reiser4/debug.c:73!
invalid operand: 0000 [#1]
CPU:    0
EIP:    0060:[<c0253f40>]    Not tainted
EFLAGS: 00010246
EIP is at reiser4_do_panic+0x1f0/0x2c0
eax: 00000000   ebx: d4a0bdf8   ecx: d467f7f8   edx: 00000001
esi: d477aefc   edi: 00000000   ebp: d49c3d40   esp: d49c3d20
ds: 007b   es: 007b   ss: 0068
Process ktxnmgrd:run (pid: 510, threadinfo=d49c2000 task=d49039b0)
Stack: d4a0bdf8 00000001 c040fc66 d49c3d4c c03fb32c c040f9d2 000005a6 
c040fc42
       d49c3d64 c028a9f4 c040fc4c 00000001 c040fc42 c03fb32c c040f9d2 
000005a6
       d686da78 d49c3d94 c02815d9 d686da78 d49c3db4 d686da78 00000000 
d49c3e58
Call Trace:
 [<c028a9f4>] .text.lock.vfs_ops+0x0/0x2c
 [<c02815d9>] finish_all_fq+0x169/0x170
 [<c0281613>] current_atom_finish_all_fq+0x33/0x150
 [<c010d616>] do_IRQ+0x1f6/0x460
 [<c0269c31>] current_atom_complete_writes+0x11/0x30
 [<c0269e28>] commit_current_atom+0x1d8/0x480
 [<c026bee7>] try_commit_txnh+0x1d7/0x310
 [<c0123fc8>] schedule+0x298/0x990
 [<c026c058>] commit_txnh+0x38/0x230
 [<c026768f>] txn_end+0x3f/0x50
 [<c026b055>] commit_some_atoms+0x695/0x880
 [<c026179b>] init_context+0xbb/0x100
 [<c01246c0>] default_wake_function+0x0/0x30
 [<c0283faf>] scan_mgr+0x2f/0x45
 [<c02c7f66>] snprintf+0x26/0x30
 [<c028345d>] ktxnmgrd+0x2dd/0x630
 [<c010a776>] ret_from_fork+0x6/0x14
 [<c0283180>] ktxnmgrd+0x0/0x630
 [<c010774d>] kernel_thread_helper+0x5/0x18
 
Code: 0f 0b 49 00 d8 f0 40 c0 c7 04 24 a9 af 42 c0 b8 40 99 50 c0


This happens very soon into the following command:
ropeable:/mnt/test# tar xvf /home/backup/backup.tar
1-ext2/
1-ext2/lost+found/
1-ext2/test1

1-ext2 is a reiser4 mount point, not actually ext2 of course.
test1 is a 256MB file of all zeros.

filesystem created with default options, mounted with noatime,nodiratime.
I'll try without the extra mount options now.


