From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: reiserfsck with LVM read-only snapshot
Date: Fri, 10 Nov 2006 17:11:13 -0000
Message-ID: <20061110170913.0A53912EE1@bluewhale.planbit.co.uk>
References: <4554AEA1.8070802@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30137-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4554AEA1.8070802@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'David Masover' <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

Hi David,

Thanks for the reply - see my comments below...

> -----Original Message-----
> From: David Masover [mailto:ninja@slaphack.com]
> Sent: 10 November 2006 16:54
> To: Roger Lucas
> Cc: reiserfs-list@namesys.com
> Subject: Re: reiserfsck with LVM read-only snapshot
> 
> Roger Lucas wrote:
> 
> > I have tried adding the "--no-journal-available" option to tell it *not* to replay the journal,
> but it insists on trying to replay
> > the journal, even though I have told it not to.  When it does this, the same error occurs.
> 
> Is there any way you can force reiserfsck to do this read-only?

That's what I would like to know.  I don't mind if I have to give reiserfsck somewhere else to write the rebuilt journal to (e.g. a
file or similar), but I absolutely do not want it writing *back* to the snapshot.

> 
> > I understand that Reiser3 is a journalling file system and you would normally replay the journal,
> but I want to check my read-only
> > copy of the snapshot so that I know it is valid.
> 
> It isn't.
> 
> By definition, assuming this is a snapshot of a live (mounted)
> filesystem, it's not really valid -- it's as if you pulled the plug. I
> can understand why you'd want to do this, but any way you run
> reiserfsck, it's going to tell you that something's wrong, even if that
> "something" is only that it hasn't replayed the journal yet.
> 

I understand what you mean.  I appreciate that snapshotting a live (i.e. mounted read-write) filesystem will give you just that, a
snapshot, and individual files may be in a state of flux such that their contents are invalid or inconsistent.

In this situation, however, the disk is mounted read-only so it *shouldn't* be changing.  I'm just "snapshot"ing the read-only
mounted image because I am paranoid.  

> > I don't want to change the snapshot in any way (e.g. such as writing the journal
> > changes to it) so that I know the checksum and image data match.  If I take a R/W snapshot then
> run reiserfsck, it writes changes to
> > the snapshot.
> 
> I see where you're going with this.
> 
> I don't use LVM for snapshots, but I do use dm_snapshot sometimes, for
> exactly this sort of thing -- I have one device I don't want to touch,
> so I grab a chunk of spare space (my swap partition) to use as a
> snapshot device, and take a read/write snapshot and mess with that. My
> original partition is untouched, but I can run fsck.reiser4 on the
> snapshot, try to recover deleted files, etc.
> 
> Now, bear with me. I know you want a read-only snapshot.
> 
> What you want to do is create a read/write snapshot of your read-only
> snapshot. That way, you can still have your checksum run on the
> read-only snapshot, and it will match what you expect, but you can also
> run reiserfsck on the read/write snapshot, and throw it away when you're
> satisfied.

Yep.  That's what I would like too, but LVM cannot do snapshots-of-snapshots yet.

> 
> I don't know the procedure for doing this with LVM, but I may be able to
> show you how I'd do it directly with dm_snapshot. It's a bit more
> cumbersome than if reiserfsck cooperated, but you're using a script
> anyway, so it shouldn't be too bad.

Hmmm.  I'm not sure about dm_snapshot having not used it before and LVM seems to work pretty well (at least as far as its
capabilities allow).  I'm open to all suggestions, however.

- Roger

