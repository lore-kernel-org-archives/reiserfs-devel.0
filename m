From: Chris Mason <mason@suse.com>
Subject: Re: Quicker alternative to "find /"?
Date: Mon, 16 Aug 2004 09:06:01 -0400
Message-ID: <1092661560.12138.24.camel@watt.suse.com>
References: <20040815231640.3c926886.felix.klee.reiserfs@gmx.net>
	 <1092660765.28417.4.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20325-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1092660765.28417.4.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christophe Saout <christophe@saout.de>
Cc: "Felix E. Klee" <felix.klee.reiserfs@gmx.net>, reiserfs-list@namesys.com

On Mon, 2004-08-16 at 08:52, Christophe Saout wrote:
> Am Sonntag, den 15.08.2004, 23:16 +0200 schrieb Felix E. Klee:
> 
> > I'd like to store the directory structure of a partition formatted as
> > ReiserFS into a file. Currently, I use
> > 
> >     find / >file
> > 
> > This process takes approximately 5 minutes (the result is 26MB of
> > data). Are there any alternative *quicker* ways to do this?
> 
> The main problem is that find only uses one thread. This thread only
> reads one directory at once and as a result of that you'll get a lot of
> seeks.
> 
> This can usually be improved *a lot* by doing a massively multi-threaded
> search with a lot of threads trying to read a lot of directories at
> once. The disk io scheduler will then linearize all the outstanding read
> requests.
> 
> I've done something similar to speed up a diff -r using a shell script
> (not for find but for reading the file content that should be compared).
> 

This gets tricky quickly.  Many threads reading many different
directories at once will introduce a lot of seeks, since the directories
are likely to be far apart on disk.  It is far better for the filesystem
to realize a sequential scan of the directory is in progress and do
smarter readahead based on that.  

The latest patches in 2.6.8 for reiser v3 do some of this, triggering
metadata readahead on readdirs.  You can also make things faster by
mounting with -o noatime,nodiratime.

This is one workload where v4 should do better, since the inode data is
close to the directory entry.

-chris


