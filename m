From: "Charles P. Wright" <cwright@cs.sunysb.edu>
Subject: Re: My Dad suggests a redundant copies plugin
Date: Wed, 26 Oct 2005 11:49:00 -0400
Message-ID: <1130341740.13999.5.camel@polarbear.fsl.cs.sunysb.edu>
References: <435DC714.6000505@namesys.com>  <20051025072537.GB8402@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26656-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051025072537.GB8402@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

On Tue, 2005-10-25 at 09:25 +0200, Sander wrote:
> Hans Reiser wrote (ao):
> > This would not be (at least in theory) useful for RAID devices, but for
> > a user with a single disk drive, it might be useful to have a plugin
> > that creates two (or N) copies, and tries to allocate the two copies at
> > opposite ends of the disk. Anyone out there still looking for a plugin
> > to write?
> 
> That will kill performance badly. First of all the two read/writes
> needed, and second because you have to seek from one end to the disk to
> the other every time you read/write something.
> 
> And what is the advantage? You are not protected against a lot of disk
> failures (only against bad blocks, right?).
> 
> There is a lot more advantage in buying two disks and do raid over them.
> This is (much) cheaper, gives better performance and gives more
> protection.
> 
> Anyway, no need for a plugin. You can just divide your disk in two
> partitions and configure them as a raid1.
There is an interesting paper from UWISC in SOSP (the one going on right
now) about file system reliability.  They actually claim that there are
quite a few situations in which disks break not as a whole unit.  The
enhanced Ext3 to have clearly defined failure semantics, and be a bit
more tolerant of disk failures.   If anyone wants to tackle this sort of
plugin, their paper is a must read.

Another interesting, but separate, thing in that paper is that they
checksum each journal transaction and write the checksum at the end.
Because they can tell if the journal transaction is valid through the
checksum, they can avoid all synchronous journal writes.

Charles

