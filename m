From: Chris Mason <mason@suse.com>
Subject: Re: fsync() Performance Issue
Date: 04 May 2002 09:11:24 -0400
Message-ID: <1020517884.3947.266.camel@tiny>
References: <93F527C91A6ED411AFE10050040665D0049BF9B4@corpusmx1.us.dg.com>
	<1020463205.3946.252.camel@tiny>  <3CD341EC.9080906@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10236-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CD341EC.9080906@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: berthiaume_wayne@emc.com, reiserfs-list@namesys.com, green@namesys.com

On Fri, 2002-05-03 at 22:05, Hans Reiser wrote:

> >The barrier option doesn't make much difference because the write cache
> >is off.  With write cache on, the barrier code should allow you to be
> >faster than with the caching off, but without risking the data (Jens and
> >I are working on final fsync safety issues though).
> >
> >Hans, data=journal turns on the data journaling.  The data journaling
> >
> and the reason it is faster is....

Any time you append X number of bytes followed by an fsync (or O_SYNC),
you trigger a commit for the modified metadata, and then a seek to write
the data block.  You wait on the log blocks (usually 5 or 6 of them
total in the transaction) and then you wait for the data block to hit
the main disk area.

With data logging, you also write the data block to the log, and that
means you can wait a while to flush it back to the main disk.  This
increases the size of the transaction by 1, but writing 7 blocks to the
log is almost no different from writing 6.

You don't have to seek back to the main disk until you need to flush the
transaction.  The new code also flushes metadata from more the one
transaction at once, leading to less waiting overall.

The new code is smarter about triggering updates to the journal header
block, it happens much less frequently now, leading to fewer seeks and
less waiting.

As the size of the O_SYNC/fsync write increases, the benefit goes down. 
A 16k write only gets around 30% improvement with the new patches. 
Since a 1k write still needs to write a whole block, it should be the
same speed as a 4k write.

Wayne, you might want to try the 1k test mounted with -o notail.

-chris


