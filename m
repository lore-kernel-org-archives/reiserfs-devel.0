From: "Sarath Menon" <sarathmenon@gmail.com>
Subject: Re: fsck.reiser4 segfaults
Date: Wed, 5 Apr 2006 05:30:53 +0530
Message-ID: <932539950604041700p409e00eam3f916764c1b15494@mail.gmail.com>
References: <932539950603310621m67305c9eg42492492b84767fc@mail.gmail.com>
	 <1143822776.6320.84.camel@tribesman.namesys.com>
	 <932539950603311021x201d9e13mfdf9e95923e1f744@mail.gmail.com>
	 <1144059702.6316.62.camel@tribesman.namesys.com>
	 <932539950604041657t42d33902s34dc8abcf056aa49@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28442-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <932539950604041657t42d33902s34dc8abcf056aa49@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

CC-ing to the list.

On 4/5/06, Sarath Menon <sarathmenon@gmail.com> wrote:
> Hi Vlad,
>
> Sorry I missed your email, I wasn't really checking my mails. The dump
> is available from http://sarath.dyndns.org/r4/reiser4-metadata.bz2.
>
> Please let me know if you need more information.
>
> On 4/3/06, Vladimir V. Saveliev <vs@namesys.com> wrote:
> > Hello
> >
> > On Fri, 2006-03-31 at 20:21 +0200, Sarath Menon wrote:
> > > reiserfsprogs and libaal are both 1.0.5. I'll give you the dmesg
> > > output tommorow - I need to get a livecd with reiser4 patches - its
> > > more difficult than I initially thought ;)
> > >
> > > Here's the gdb bt output - that's the max that I can provide today.
> > >
> > > Program received signal SIGSEGV, Segmentation fault.
> > > 0x40052dd1 in repair_filter_update_traverse () from /tmp/reiser4/lib
> > > (gdb) bt
> > > #0  0x40052dd1 in repair_filter_update_traverse () from /tmp/reiser4
> > > #1  0x40015959 in reiser4_tree_trav_node () from /tmp/reiser4/lib/li
> > > #2  0x40015938 in reiser4_tree_trav_node () from /tmp/reiser4/lib/li
> > > #3  0x40052356 in repair_filter_traverse () from /tmp/reiser4/lib/li
> > > #4  0x40051c8c in repair_filter () from /tmp/reiser4/lib/librepair-1
> > > #5  0x400575ea in repair_check () from /tmp/reiser4/lib/librepair-1.
> > > #6  0x0804a1cb in main ()
> > > #7  0x4102eda6 in __libc_start_main () from /lib/libc.so.6
> > >
> > > I'll post the dmesg output tommorow.
> > >
> >
> > I would like to debug this problem. Can you please do
> > debugfs.reiser4 /dev/thatdevice -P | bzip2 -c > reiser4-metadata.bz2
> > and put resulting file somewhere for downloading. That should make
> > debugging easier.
> >
> > > Thanks,
> > > Sarath
> > >
> > > On 3/31/06, Vladimir V. Saveliev <vs@namesys.com> wrote:
> > > > Hello
> > > >
> > > > On Fri, 2006-03-31 at 16:21 +0200, Sarath Menon wrote:
> > > > > Hello,
> > > > >
> > > > > I've been using reiser4 for more than a year without any problems=
. The
> > > > > filesystem performance has been commendable to say the least.
> > > > > Yesterday, I had to powercycle my pc (due to a dma hang with my c=
d
> > > > > drive - happens occasionaly) and after the reboot, grub would not
> > > > > load. I use a single root partition (/boot inclusive) and the pat=
ched
> > > > > grub sources.
> > > > >
> > > > > I've tried booting into knoppix and compiling reiser4progs and ru=
nning an
> > > > fsck.
> > > > >
> > > > > This is what I get -:
> > > > > Master super block (16):
> > > > > magic:          ReIsEr4
> > > > > blksize:        4096
> > > > > format:         0x0 (format40)
> > > > > label:          <none>
> > > > >
> > > > > Format super block (17):
> > > > > plugin:         format40
> > > > > description:    Disk-format for reiser4.
> > > > > magic:          ReIsEr40FoRmAt
> > > > > flushes:        0
> > > > > mkfs id:        0x3a4f3c7b
> > > > > blocks:         2443880
> > > > > free blocks:    428490
> > > > > root block:     743745
> > > > > tail policy:    0x2 (smart)
> > > > > next oid:       0xf63a06
> > > > > file count:     469920
> > > > > tree height:    5
> > > > > key policy:     LARGE
> > > > >
> > > > >
> > > > > CHECKING STORAGE TREE
> > > > > FSCK: Node (743744), item (0), unit (0): Points to the block (743=
745)
> > > > > which is in the tree already.
> > > > > The whole subtree is skipped.
> > > > > Segmentation fault
> > > > >
> > > >
> > > > can you please run dmesg after that and send its output?
> > > >
> > > > > debugfs.reiser4 also segfaults, and a mount also fails, it compli=
ans
> > > > > of a duplicate key. (I can't post the exact message because the s=
econd
> > > > > livecd doesn't have X or any mail client :(
> > > > >
> > > > >
> > > > > Cheers,
> > > > > Sarath
> > > > >
> > > > > --
> > > > > I presume, when you pronounce iptables, you say that you are peei=
ng tables.
