From: Chris Mason <mason@suse.com>
Subject: Re: External journals and NVRAM devices
Date: 06 Nov 2002 15:42:10 -0500
Message-ID: <1036615330.14551.719.camel@tiny>
References: <20021101213703.D142A50D503@server5.fastmail.fm>
	<1036415792.14291.12.camel@tiny> <3DC836D2.5060100@namesys.com> 
	<20021106201832.GR588@clusterfs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11938-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021106201832.GR588@clusterfs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: reiser <reiser@namesys.com>, JP Howard <jh_lists@fastmail.fm>, Edward Shishkin <edward@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, Oleg Drokin <green@namesys.com>

On Wed, 2002-11-06 at 15:18, Andreas Dilger wrote:
> On Nov 05, 2002  13:23 -0800, reiser wrote:
> > Chris Mason wrote:
> > >With ext3, a 128M or bigger log can really improve performance because
> > >so much of the writeback is done through bdflush/kupdate. 
> >
> > Please explain the because clause of the sentence above in more detail.
> 
> Nobody has answered this yet AFAIK, so I will.
> 
> The reason that having a large log can help performance is because
> having bdflush drive the dirty buffer writeout allows for more changes
> of write merging by the elevator and such, and also avoids stalls in
> user-space code as it waits for a full journal to commit transactions.
> 
> There is a fine line here (for ext3 at least), because if you have a
> large journal but it fills up before the transactions have been flushed
> to the filesystem, then user apps stall while the journal is flushed
> (can be several seconds).

Sorry for the delay.  This is why tuning bdflush with a large ext3 log
to trigger writeback quickly can help.  It lowers the chance userspace
will have to wait for the log to flushed by decreasing the time dirty
buffers are allowed to hang around.  (andreas knows this better than I
do, just trying to explain my last message ;-)

The major difference with reiserfs (patched or not) is the log is
flushed per transaction instead of trying to reclaim the whole thing.

In the stock kernels, this really hurts reiserfs with small
transactions, because it only flushes one transaction at a time.  This
means I write 3 or 4 blocks, wait, then write 3 or 4 more, wait, etc.

The data logging patches have code to send more than one transaction at
once, so I reclaim the log in chunks of about 200 blocks.  The end
result is the log wrapping around is a less expensive operation with the
patches applied, and you usually won't need as large a log to make
data=journal work well.  

The downside to my current code is that reiserfs can pin more ram (up to
the size of the log) than ext3, and for a longer period of time.

If you're going to disk, large logs are easy to come by.  nvram is
different though, so it matters more there.

-chris


