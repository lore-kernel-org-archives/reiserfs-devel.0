From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck --blame-it-on-the-hardware-yeah-yeah
Date: Mon, 10 Feb 2003 16:11:32 +0300
Message-ID: <20030210161132.A15924@namesys.com>
References: <20030208005057.GA1059@horo.vilain.net> <20030208224928.A30012@ns.soreal.co.uk> <20030209130116.A32206@namesys.com> <200302110525.06890.sam@vilain.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12681-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302110525.06890.sam@vilain.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Vilain <sam@vilain.net>
Cc: reiserfs-list@namesys.com, vitaly@namesys.com

Hello!

On Tue, Feb 11, 2003 at 05:24:58AM +1300, Sam Vilain wrote:
> > > Therefore, your reiserfsck has a bug.  The whole point of a fsck is
> > Well, currently the logic is "If we cannot read some block, that
> > usually means this is a badblock".
> > And so it prints the message. Of course more testing about
> > if the block is beyond partition boundary should be probably added.
> The block is not bad, it's EINVAL :-).  The block *number* is bad; you 

Sure.

> *could* add to your is_block_shagged() function a test for whether the 
> block is out of bounds, but the point is that if it gets as far as that 
> function, chances are that it is too late.

This is being worked on currently.

> (In reiserfsck), you need to do the bounds check when the referring 
> block/data structure is checked.

Sure. We have some checks, though apparently not enough.

[horrors about recompiling fsck with customly disabled stuff skipped].
If you really decided to shoot yourself in the foot, you might as well
just will journal with zeroes. It would be much easier this way ;)

>   - filesystem now mounts, however about the first 2 levels of directories,
>     and many recently written files, have had their directory entries
>     lost - lost+found contains roughly 11,000 entries (of 150,000 or
>     so).

Hm, probably corresponding blocks (with names) were only present in
journal, and you erased that.

>   - thankfully, I can locate the several hundred megabytes of .debs to save
>     myself spending days re-downloading it all over 56k :-).  Mission
>     successful.

At least you have not lost anything valuable. This is good.

> If reiserfsck was built with --no-journal-available in mind (that is, 
> ignoring the data present in an in-partition journal with that switch), 
> then I'm fairly sure that I wouldn't have suffered the last problem.  

How so?

> After the first scan, the journal would have been written back to an empty 
> state.

So what? If directories content was only present in journal, you just loose that info.

> > > I'm going to try removing that test in the 3.x.1b version and see if
> > > the fsck completes.
> > Well, 3.x.1b should not be actually used, lots of bugs were fixed since
> > then.
> > Vitaly: We need a check that journal target block is in range of
> > filesystem. Please add this test.
> That is not all you must do!

> You need to do one, preferably both of the following:
>   a) allow reiserfsck to ignore the in-partition journal, without producing
>      an insane result (where the filesystem header says there is a journal,
>      but the space where the journal is has filesystem data in it).

This cannot happen in any sane way. (I mean root block just cannot live in journal).

>   b) make reiserfsck validate the journal as well as the filesystem,
>      probably playing them back itself rather than relying on a mount
>      option that just does the playback for it.  In theory you could decide
>      whether to use the on-disk or the in-journal data structure, depending
>      on which was more consistent!

I was thinking about that already. May be we will do something like that in 2.7/2.8,
but certainly not now. And it will make lots of complications, I fear.
People who will forget to upgrade their reiserfsprogs will get in trouble when
upgrading kernels and so on...

Bye,
    Oleg
