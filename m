From: Chris Mason <mason@suse.com>
Subject: Re: fsync() Performance Issue
Date: 06 May 2002 08:40:27 -0400
Message-ID: <1020688827.3947.2087.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10253-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CD3F76D.4000708@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: berthiaume_wayne@emc.com, reiserfs-list@namesys.com, green@namesys.com

On Sat, 2002-05-04 at 10:59, Hans Reiser wrote:
>
> So how about if you revise fsync so that it always sends data blocks to 
> the journal not to the main disk?

This gets a little sticky.

Once you log a block, it might be replayed after a crash.  So, you have
to protect against corner cases like this:

write(file)
fsync(file) ; /* logs modified data blocks */
write(file) ; /* write the same blocks without fsync */
sync ;        /* use expects new version of the blocks on disk */
<crash>

During replay, the logged data blocks overwrite the blocks sent to disk
via sync().

This isn't hard to correct for, every time a buffer is marked dirty, you
check the journal hash tables to see if it is replayable, and if so you
log it instead (the 2.2.x code did this due to tails).  This translates
to increased CPU usage for every write.

I'd rather not put it back in because it adds yet another corner case to
maintain for all time.  Most of the fsync/O_SYNC bound applications are
just given their own partition anyway, so most users that need data
logging need it for every write.

-chris




