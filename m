From: Konstantin Besch <forward@zagon.com>
Subject: Re: BUG in writeback mode - from data journaling patch
Date: Mon, 30 Aug 2004 12:32:32 -0400
Message-ID: <200408301232.32560.forward@zagon.com>
References: <d68fdf7d040819113256eba856@mail.gmail.com> <200408301803.57727.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21114-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408301803.57727.Dieter.Nuetzel@hamburg.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: reiserfs-list@namesys.com

The notification about this bug been there for a while - seems=20
like Vijayan spent some time hunting it down ( I know he did  ) .=20
Doesn't seem like a lot of time from the developers to verify validity of t=
he=20
bug/fix introduced , unless Chris missed on the information and didn't noti=
ce=20
it.=20
On the other hand, since the software is GPL we might not even know the
answer , not that we paid for ReiserFS with our credit cards or anything :)

             --K

just my two cents - since I would like to know if there is an answer at all=
 to=20
this question , too .

On Monday 30 August 2004 12:03 pm, Dieter N=FCtzel wrote:=20
> Am Donnerstag, 19. August 2004 20:32 schrieb Vijayan Prabhakaran:
> > Dear Chris Mason,
> >
> > I found a bug in writeback mode. In writeback mode, when a file block
> > was overwritten, the file's stat information was not getting updated.
> > For more details on this, please refer to my previous mail on the same
> > topic.
> >
> > I tracked down the bug to the data journaling patch.
> >
> > Bug description:
> > ----------------
> >
> > In file inode.c, there is a function called __commit_write(). In that
> > function, there is a "if" condition:
> >
> > if (reiserfs_data_ordered(inode->i_sb)) {
> >   lock_kernel();
> >   add_to_flushlist(inode, bh);
> >   /* if we don't update the inode trans information,
> >    * an fsync(fd) might not catch these data blocks
> >    */
> >
> >   reiserfs_update_inode_transaction(inode);
> >   unlock_kernel();
> > } else {
> >   buffer_insert_inode_data_queue(bh, inode);
> > }
> >
> > If you look at the condition, for ordered mode, the inode transaction
> > information gets updated by the call
> > reiserfs_update_inode_transaction(). But, for writeback mode, this is
> > not done.
> >
> > Since the inode transaction information is not updated, later in
> > function __commit_trans_jl() (which is in file journal.c), the
> > following "if" condition fails.
> >
> > flush_commit_only:
> > if (journal_list_still_alive(inode->i_sb, id)) {
> >   ...
> > }
> >
> > Because of this failure, the file's stat data, even though available
> > in the transaction list, did not get written to the disk.
> >
> > Bug fix:
> > --------
> >
> > If we add reiserfs_update_inode_transaction() call in __commit_write()
> > for the writeback mode, then it works fine. That is,
> >
> > if (reiserfs_data_ordered(inode->i_sb)) {
> >   lock_kernel();
> >   add_to_flushlist(inode, bh);
> >   /* if we don't update the inode trans information,
> >    * an fsync(fd) might not catch these data blocks
> >    */
> >
> >   reiserfs_update_inode_transaction(inode);
> >   unlock_kernel();
> > } else {
> >   reiserfs_update_inode_transaction(inode);
> >   buffer_insert_inode_data_queue(bh, inode);
> > }
> >
> > Could you please verify this fix and if you think it is appropriate,
> > can you please add this to your patch.
> >
> > I appreciate your help.
>
> Chris,
>
> any thoughts on this?
>
> -Dieter
