From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 19:25:56 +0300
Message-ID: <200302121925.56902.vitaly@namesys.com>
References: <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au> <3452483515.20030212001747@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12719-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3452483515.20030212001747@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 12 February 2003 02:17, Anders Widman wrote:
> >> I've used ReiserFS in the past, but have also used ext3 on my
> >> user's important
> >> data (/home) after a good chunk of one drive was converted to
> >> sparse/null files due to a screwup stemming from no 'badblocks' support
> >> in reiserfs.  Since then, i've used ext3 as well as Reiser but recently
> >
> > I can't comment on your experience, but personally if I have a drive with
> > any number of badblocks (which are showing up to the fs layer, not
> > invisibly re-mapped by the drive) then I take the drive back and get a
> > replacement, or bin the drive.
>
> However,  the FS SHOULD support handling of bad blocks/clusters at the
> FS  layer,  even  while running in a production system. Bad blocks can
> pop  up  at any give time for no particular reason, and it is at these
> times  you  (we) need a strong and reliable filesystem that can handle
> and logically remap broken blocks/sectors.
>
> Sure,  a  disk  with physical errors should be replaced, but until you
> find out about the error on the drive the FS HAS TO HANDLE these kinds
> of problems.

That is difficult to say if bad blocks should be handled at fs layer or not. 
It would be useful to have this problem solved somehow, but harddrives with 
their remappings looks like the proper part of doing this. And probably fs 
layer should just skilfully use some interface for such remapping. Well, 
remapping is probably not correct word here. Thus, Xuan Baldauf 
<xuan--reiserfs@baldauf.org> sent us his program once claimed that it recovered 
blocks w/out remapping. The explanations were the following:

> The problem is that often multiple adjacent blocks are bad. You'll have to detect
> them manually. Once you know the bad blocks, just trying to overwrite them usually
> does not succeed because the disk wants to seek to that block exactly (which does
> not work for the same reason the block is bad). But if the whole track is
> rewritten, the bad blocks usually are gone.
>
> I suspect track wandering for this: due to small misalignments at each write, a track (or more
> precisely, and arc of the track which contains the block to be written) slowly wanders. If the
> misalignments do not zero out each other, they add up to a bias. If an arc of an has been
> written many times, it will have wandered under these conditions. If the wandering has
> progressed too far, the wandering arc slowly reaches the next neighbouring track.
>
> Now imagine an access to the wandered track: if the head seeks to the original position of the
> wandered track, it may not be able to read the wandered arc because it is too far away (lower
> signal quality). If the head seeks to the new position of the wandered arc, the signal may be
> interfered by the neighbouring track.
>
> Both effects may occur, which one does not really matter, both makes parts of the wandered arc
> inaccessible
>
> The problem is: the individual wandered arc is no longer accessible, because the disk
> controller cannot sync to the block it is flying over because of the bad
> signal-to-noise-ratio. And if the wandered arc is accessible, another write will make it
> further wander up to inaccessibility.
>
> But if the seek to the track of the arc which should be overwritten occurs before the wandered
> arc, the disk controller actually can sync to the track and then write the whole track,
> effectivily creating the track new and only having the bias of the not-wandered part of the
> track. Thus, the wandered arc has not wandered anymore compared to the other arcs of the
> track.

Well, it worked. We had some bad blocks on a drive, write to them failed, after using 
this program there were no bad blocks anymore. 

So it would be possible to do some actions to 1) get some blocks back in the described 
way, 1.1) write to really bad blocks should have remaped them already here if there is 
a space in remap area 2) save bad blocks to badblock list in fs if they are still bad - 
out of remap area. 
Would be not bad to try to recover in this way already remapped blocks - do not know how 
to get the list of them only.

Ok, but what if the IO error you got is not a bad block, but a bad cable? Do you want 
the fs to work in the described way? trying to fix all automatically? I am not sure. 
Now about the user space. Using badblocks and some programs like Xuan Baldauf sent us
and just trying to write to bad blocks make them being remapped - that is how you can 
try to get rid of some amount of badblocks. Should a drive with amount of bad blocks 
which exceeds the remap area be used? It is a realy rare case that the amount of bad 
blocks of such a drive does not get increased - the case where you may want to continue 
using the drive - so this is why a proper support for bad blocks was not implemented 
in reiserfs yet. And probably it is not the most urgent thing to do. 

-- 

Thanks,
Vitaly Fertman
