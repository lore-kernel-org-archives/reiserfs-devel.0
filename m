From: John Fettig <jfettig@students.uiuc.edu>
Subject: Re: reiserfsck --rebuild-tree aborted
Date: Tue, 28 Jan 2003 00:30:44 -0600
Message-ID: <20030128003044.A26782@ux5.cso.uiuc.edu>
References: <20030110005346.A24040@ux13.cso.uiuc.edu> <200301101640.13350.vitaly@namesys.com> <20030110165836.A13329@ux8.cso.uiuc.edu> <200301111508.31443.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12525-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200301111508.31443.vitaly@namesys.com>; from vitaly@namesys.com on Sat, Jan 11, 2003 at 03:08:31PM +0300
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: John Fettig <jfettig@students.uiuc.edu>, reiserfs-list@namesys.com

* Vitaly Fertman <vitaly@namesys.com>: 
> On Saturday 11 January 2003 01:58, John Fettig wrote:
> > * Vitaly Fertman <vitaly@namesys.com>:
> > > > build_the_tree: Nothing but leaves are expected. Block 8532-??22683
> > > > build_the_tree: Nothing but leaves are expected. Block 8580-??22660
> > > > pass1.c 405 pass1_correct_leaf
> > > > pass1_correct_leaf: block 8581, item 0, pointer 22: The wrong pointer
> > > > (944715855) in the file [7471218 636]. Must be fixed on pass0.
> > > > Aborted
> > >
> > > All this looks like an fsck bug, but could be some kind of hardware
> > > problem also. I would like to have a look at the metadata of your
> > > partition. Could you run debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
> > > and make it available for downloading.
> >
> > You can download the output from debugreiserfs from:
> > http://salty.ncsa.uiuc.edu/debugout.bz2
> >
> > Please let me know what you find.
> >
> > John
> 
> Hi, I have not found any problem with these metadata. Could you check 
> your memory. And how did you run that dlgdiag? Not under linux I guess? 
> So linux could choose some dma settings which are faulty with your drive.
> Could you check it under linux also.

Just as a happy update, after I reinstalled linux on a different drive
(Debian unstable) with the 2.4.20 kernel and reiserfsprogs 3.6.4, I
found that the --rebuild-tree successfully completed.  Everything got
tossed into the lost+found directory, but it appears to be all there.
Many thanks!  I don't understand what changed between now and
then...weird.

Perhaps it was a problem with the boot cd that I was using.

John
