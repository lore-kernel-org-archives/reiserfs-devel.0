From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [PATCH]: reiser4 [5/8] export remove_from_page_cache()
Date: Fri, 1 Nov 2002 14:56:54 -0700
Message-ID: <20021101215653.GH8864@clusterfs.com>
References: <20021031163104.A9845@infradead.org> <Pine.LNX.4.44.0210311053170.1526-100000@penguin.transmeta.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11905-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0210311053170.1526-100000@penguin.transmeta.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@transmeta.com>
Cc: Christoph Hellwig <hch@infradead.org>, Nikita Danilov <Nikita@Namesys.COM>, Linux Kernel Mailing List <Linux-Kernel@vger.kernel.org>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Oct 31, 2002  10:57 -0800, Linus Torvalds wrote:
> On Thu, 31 Oct 2002, Christoph Hellwig wrote:
> > What about chaing truncate_inode_pages to take an additional len
> > argument so you don't have to remove all pages past an offset?
> 
> Actually, we may want that for other reasons anyway. In particular, I can
> well imagine why a networked filesystem in particular might want to
> invalidate a range of a file cache, but not necessarily all of it.
> 
> (Yeah, I don't know of any network filesystem that does invalidation on
> anything but a file granularity, but I assume such filesystems have to
> exist. Especially in cluster environments it sounds like a sane thing to
> do invalidates on a finer granularity)

Yes, we definitely need such a beast for Lustre.  Currently (because we
haven't gotten around to fixing it) we invalidate the whole file if
there is a lock conflict when we really only want to invalidate a
page or range of pages.

Our "performance" release isn't until next year - we're still working
on "performant" right now, but in the case of multiple clients writing
to non-overlapping areas in a file, or different files we're still
pretty good - abount 1.5GB/s aggregate write speed with 20 storage targets.

We have 62 storage targets in our target environment, but haven't done
a full tests because we're working on some nasty distributed metadata
bugs right now.  Since the client->target I/O is pretty much independent,
there should be no problems hitting 4.5 GB/s aggregate write speed.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

