From: Chris Mason <mason@suse.com>
Subject: Re: fsync() Performance Issue
Date: 29 Apr 2002 12:30:21 -0400
Message-ID: <1020097821.1734.189.camel@tiny>
References: <93F527C91A6ED411AFE10050040665D0049BF961@corpusmx1.us.dg.com> 
	<20020429162020.92AD93EA8@lyta.coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10197-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020429162020.92AD93EA8@lyta.coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: berthiaume_wayne@emc.com, reiserfs-list@namesys.com

On Mon, 2002-04-29 at 12:20, Russell Coker wrote:
> On Fri, 26 Apr 2002 22:28, berthiaume_wayne@emc.com wrote:
> 
> It's interesting to note your email address and what it implies...
> 
> > 	I'm wondering if anyone out there may have some suggestions on how
> > to improve the performance of a system employing fsync(). I have to be able
> > to guaranty that every write to my fileserver is on disk when the client
> > has passed it to the server. Therefore, I have disabled write cache on the
> > disk and issue an fsync() per file. I'm running 2.4.19-pre7, reiserfs
> > 3.6.25, without additional patches. I have seen some discussions out here
> > about various other "speed-up" patches and am wondering if I need to add
> > these to 2.4.19-pre7? And what they are and where can I obtain said
> > patches? Also, I'm wondering if there is another solution to syncing the
> > data that is faster than fsync(). Testing, thusfar, has shown a large
> > disparity between running with and without sync.Another idea is to explore
> > another filesystem, but I'm not exactly excited by the other journaling
> > filesystems out there at this time. All ideas will be greatly appreciated.
> 
> These issues have been discussed a few times, but not with any results as 
> exciting as you might hope for.  One which was mentioned was using 
> fdatasync() instead of fsync().

The speedup patches should help fsync some, since they make it much more
likely a commit will be done without the journal lock held.

If all the writes on the FS end up being done through fsync, the data
logging patches might help a lot.  These should be ready for broader
testing this week.

If you are using IDE drives, the write barrier patches are almost enough
to allow you to turn on write caching safely.  They make sure metadata
triggers proper drive cache flushes, I can try to rig up something that
will also trigger a cache flush on data syncs.

-chris


