From: Chris Mason <mason@suse.com>
Subject: Re: copying partition to partition, sector by
	sector, live
Date: 22 Apr 2002 14:58:34 -0400
Message-ID: <1019501914.24720.89.camel@tiny>
References: <20020421181614.GA11239@vega.ipal.net>
	<20020422010733.GA2379@amphibian.dyndns.org> 
	<20020422013955.GB8407@vega.ipal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020422013955.GB8407@vega.ipal.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil Howard <phil-reiserfs@ipal.net>
Cc: reiserfs-list@namesys.com

On Sun, 2002-04-21 at 21:39, Phil Howard wrote:
> On Mon, Apr 22, 2002 at 02:07:33AM +0100, Matthew Toseland wrote:
> 
> | Ummm, LVM snapshots? (man lvcreate).
> 
> No.  Nothing to do with LVM.
>

Doing it safely will require something like lvm or evms snapshots.  You
could do the sector by sector copy and then run reiserfsck
--rebuild-tree.  The latest versions of reiserfsprogs are faster, the
speed relative to a search for updated files will depend on your data
set.

More importantly you just don't get a consistent copy, regardless of the
FS you choose.  I wouldn't consider a sector by sector copy on a mounted
FS a valid backup of any type of filesystem, especially not a tree based
one.

-chris



