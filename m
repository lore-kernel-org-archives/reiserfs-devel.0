From: Corey McGuire <coreyfro@coreyfro.com>
Subject: Re: Mount Segfaults for ReiserFS Volume
Date: Mon, 8 Mar 2004 18:36:13 -0800
Message-ID: <200403081836.13400.coreyfro@coreyfro.com>
References: <200403070144.23233.coreyfro@coreyfro.com> <200403080907.01484.coreyfro@coreyfro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403080907.01484.coreyfro@coreyfro.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have still been working on recovering the data.  I have upgraded to RFSTools 
3.6.13 and "reiserfsck --rebuild-tree -S /dev/md2" completes with no errors 
but both "mount /dev/md2" and "debugreiserfs -D /dev/md2" segfault.

Please help me.  Tell me what you need and I will look for the problem.

Here is 3MB's of output from "debugreiserfs -D /dev/md2 &> bob.txt" (up unto 
the point it segfaults) gziped to 500K.

http://www.coreyfro.com/~coreyfro/bob.txt.gz

On Monday 08 March 2004 09:07 am, Corey McGuire wrote:
> I have a question, is there any tool that allows one to read from a file
> system without mounting it?
>
> For you samba users, I am thinking like a smbclient instead of a
> smbmount... something with a crude, ftp like interface. just so I can grab
> the files I need, and nuke the rest...
>
> anything like that?
>
> On Sunday 07 March 2004 01:44 am, Corey McGuire wrote:
> > I have a RAID5 that I had to do a little rebuilding on.  I rebuilt the SB
> > and the tree, but when I tried mounting it after repair, mount would
> > segfault, locking the device to the mount that i couldn't raidstop it.
> >
> > I am running SuSE 8.2, I tried under 2.4.20, 2.4.23, and 2.6.3...
> >
> > here is a paste from dmesg, let me know if you need more before you have
> > an idea:
> >
> > found reiserfs format "3.6" with standard journal
> > Unable to handle kernel paging request at virtual address e0999004
> >  printing eip:
> > c019e12d
> > *pde = 1fe7c067
> > *pte = 00000000
> > Oops: 0002 [#1]
> > CPU:    0
> > EIP:    0060:[<c019e12d>]    Not tainted
> > EFLAGS: 00010282
> > EIP is at read_old_bitmaps+0xbd/0x100
> > eax: da87a4e0   ebx: e0991000   ecx: dfd3b940   edx: da87a4e0
> > esi: dd619400   edi: 00001000   ebp: db847000   esp: db90fdf0
> > ds: 007b   es: 007b   ss: 0068
> > Process mount (pid: 833, threadinfo=db90e000 task=dbacc6e0)
> > Stack: dfda9040 00001003 00001000 00000003 def6ac00 dd619400 83c30000
> > 000000e5 c019ec93 dd619400 00002000 def6ac1c db90fe40 db90fe44 db90fe48
> > ffffffea db847000 00000001 dd619510 db90fea0 00000000 00000000 00000000
> > c02e07b7 Call Trace:
> >  [<c019ec93>] reiserfs_fill_super+0x2c3/0x690
> >  [<c01819ff>] disk_name+0xaf/0xd0
> >  [<c01566ff>] sb_set_blocksize+0x1f/0x50
> >  [<c01560ba>] get_sb_bdev+0xea/0x170
> >  [<c019f0cf>] get_super_block+0x2f/0x40
> >  [<c019e9d0>] reiserfs_fill_super+0x0/0x690
> >  [<c015636b>] do_kern_mount+0x5b/0xf0
> >  [<c016c3a7>] do_add_mount+0x97/0x190
> >  [<c016c744>] do_mount+0x194/0x1c0
> >  [<c016c52c>] copy_mount_options+0x8c/0x110
> >  [<c016cb3f>] sys_mount+0xbf/0x140
> >  [<c010906b>] syscall_call+0x7/0xb
> >
> > Code: 89 44 fb 04 8b 86 64 01 00 00 8b 50 08 b8 01 00 00 00 8b 4c
