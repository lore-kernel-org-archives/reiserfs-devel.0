From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Thu, 24 Jul 2003 21:07:44 +0400
Message-ID: <16160.4704.102110.352311@laputa.namesys.com>
References: <3F1EF7DB.2010805@namesys.com>
	<1059062380.29238.260.camel@sonja>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15039-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1059062380.29238.260.camel@sonja>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Egger <degger@fhm.edu>
Cc: Hans Reiser <reiser@namesys.com>, linux-kernel@vger.kernel.org, reiserfs mailing list <reiserfs-list@namesys.com>

Daniel Egger writes:
 > Am Mit, 2003-07-23 um 23.02 schrieb Hans Reiser:
 > 
 > > In brief, V4 is way faster than V3, and the wandering logs are indeed 
 > > twice as fast as fixed location logs when performing writes in large 
 > > batches.
 > 
 > How do the wandering logs compare to the "wandering" logs of the log
 > structured filesystem JFFS2? Does this mean I can achieve an implicit
 > wear leveling for flash memory? 

I don't know enough about jffs2, but you can read about reiser4's
"wandering logs" and transaction manager design at the
http://www.namesys.com/txn-doc.html.

Briefly speaking, in usual WAL (write-ahead logging) transaction system,
whenever block is modified, journal record, describing changes to this
block is forced to the on-disk journal before modified block is allowed
to be written. In the worst case this means that data are written twice.

But if modified block is accessible through "pointer" of some kind
stored in its "parent" block (one can think of ext2 inode addressing
data blocks for example), we can 

1. allocate new block location on the disk ("wandered location").

2. update parent block to point to the wandered location.

3. store modified block content to the wandered location.

4. add old block location to the journal. Old block is now journal
   record for the modified version.

 > 
 > > We are able to perform all filesystem operations fully atomically,
 > > while getting dramatic performance improvements.  (Other attempts at
 > > introducing transactions into filesystems are said to have failed for
 > > performance reasons.)
 > 
 > How failsafe is it to switch off the power several times? When the
 > filesystem really works atomically I should have either the old or the
 > new version but no mixture. Does it still need to fsck or is the
 > transaction replay done at mount time? In case one still needs fsck,
 > what's the probability of needing user interaction? How long does it
 > need to get a filesystem back into a consistent state after a powerloss
 > (approx. per MB/GB)?

I should warn everybody that reiser4 is _highly_ _experimental_ at this
moment. Don't use it for production.

 > 
 > Background: I'm doing systems on compactflash cards and need a reliable
 > filesystem for it. At the moment I'm using a compressed JFFS2 over the
 > mtd emulation driver for block devices which works quite well but has a
 > few catches...
 > 
 > -- 
 > Servus,
 >        Daniel

Calculemus!
Nikita.
