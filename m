From: Vijayan Prabhakaran <pvijayan@gmail.com>
Subject: Re: BUG in writeback mode - from data journaling patch
Date: Mon, 30 Aug 2004 11:50:46 -0500
Message-ID: <d68fdf7d04083009504bb07433@mail.gmail.com>
References: <d68fdf7d040819113256eba856@mail.gmail.com>
	 <200408301803.57727.Dieter.Nuetzel@hamburg.de> <1093884137.21878.442.camel@watt.suse.com>
Reply-To: Vijayan Prabhakaran <pvijayan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21116-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093884137.21878.442.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: Dieter =?unknown-8bit?q?N=FCtzel?= <dieter.nuetzel@hamburg.de>, vijayan@cs.wisc.edu, reiserfs-list@namesys.com

The fsync man page reads as:

"...fsync copies all in-core parts of a file to disk, and waits  until
 the device  reports  that all parts are on stable storage.  It also
updates metadata stat information."

So, according to POSIX standards, the stat data must be updated on fsyncs.

Any thoughts ?

thanks,

On Mon, 30 Aug 2004 12:42:17 -0400, Chris Mason <mason@suse.com> wrote:
>=20
>=20
> On Mon, 2004-08-30 at 12:03, Dieter N=FCtzel wrote:
> > Am Donnerstag, 19. August 2004 20:32 schrieb Vijayan Prabhakaran:
> > > Dear Chris Mason,
> > >
> > > I found a bug in writeback mode. In writeback mode, when a file block
> > > was overwritten, the file's stat information was not getting updated.
> > > For more details on this, please refer to my previous mail on the sam=
e
> > > topic.
> > >
> > > I tracked down the bug to the data journaling patch.
> > >
> > > Bug description:
> > > ----------------
> > >
> > > In file inode.c, there is a function called __commit_write(). In that
> > > function, there is a "if" condition:
> > >
> > > if (reiserfs_data_ordered(inode->i_sb)) {
> > >   lock_kernel();
> > >   add_to_flushlist(inode, bh);
> > >   /* if we don't update the inode trans information,
> > >    * an fsync(fd) might not catch these data blocks
> > >    */
> > >
> > >   reiserfs_update_inode_transaction(inode);
> > >   unlock_kernel();
> > > } else {
> > >   buffer_insert_inode_data_queue(bh, inode);
> > > }
> > >
> > > If you look at the condition, for ordered mode, the inode transaction
> > > information gets updated by the call
> > > reiserfs_update_inode_transaction(). But, for writeback mode, this is
> > > not done.
> > >
> > > Since the inode transaction information is not updated, later in
> > > function __commit_trans_jl() (which is in file journal.c), the
> > > following "if" condition fails.
> > >
> > > flush_commit_only:
> > > if (journal_list_still_alive(inode->i_sb, id)) {
> > >   ...
> > > }
> > >
> > > Because of this failure, the file's stat data, even though available
> > > in the transaction list, did not get written to the disk.
> > >
> > > Bug fix:
> > > --------
> > >
> > > If we add reiserfs_update_inode_transaction() call in __commit_write(=
)
> > > for the writeback mode, then it works fine. That is,
> > >
> > > if (reiserfs_data_ordered(inode->i_sb)) {
> > >   lock_kernel();
> > >   add_to_flushlist(inode, bh);
> > >   /* if we don't update the inode trans information,
> > >    * an fsync(fd) might not catch these data blocks
> > >    */
> > >
> > >   reiserfs_update_inode_transaction(inode);
> > >   unlock_kernel();
> > > } else {
> > >   reiserfs_update_inode_transaction(inode);
> > >   buffer_insert_inode_data_queue(bh, inode);
> > > }
> > >
> > > Could you please verify this fix and if you think it is appropriate,
> > > can you please add this to your patch.
> > >
> > > I appreciate your help.
>=20
> [ full quote since it has been a while ]
>=20
> Sorry, I thought I answered this, that was a busy time in terms of
> releases here.  Basically, the inode times are not promised to get
> updated as part of the fsync (look at ext3 here as well).  In cases of a
> database server doing lots of fsyncs, you want to avoid the transaction
> commits when the server is only overwriting existing data.
>=20
> The times do get logged in data=3Dordered because it's the only way to
> make sure the ordered data blocks are actually written to disk.  The
> 2.6.x code doesn't have that bug, and as a result data=3Dordered is much
> more usable in database workloads.
>=20
> -chris
>=20
>
