From: Phil Howard <phil-reiserfs@ipal.net>
Subject: Re: copying partition to partition, sector by sector, live
Date: Mon, 22 Apr 2002 18:28:41 -0500
Message-ID: <20020422232841.GF8407@vega.ipal.net>
References: <20020421181614.GA11239@vega.ipal.net> <20020422010733.GA2379@amphibian.dyndns.org> <20020422013955.GB8407@vega.ipal.net> <1019501914.24720.89.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10133-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1019501914.24720.89.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

On Mon, Apr 22, 2002 at 02:58:34PM -0400, Chris Mason wrote:

| On Sun, 2002-04-21 at 21:39, Phil Howard wrote:
| > On Mon, Apr 22, 2002 at 02:07:33AM +0100, Matthew Toseland wrote:
| > 
| > | Ummm, LVM snapshots? (man lvcreate).
| > 
| > No.  Nothing to do with LVM.
| >
| 
| Doing it safely will require something like lvm or evms snapshots.  You
| could do the sector by sector copy and then run reiserfsck
| --rebuild-tree.  The latest versions of reiserfsprogs are faster, the
| speed relative to a search for updated files will depend on your data
| set.
| 
| More importantly you just don't get a consistent copy, regardless of the
| FS you choose.  I wouldn't consider a sector by sector copy on a mounted
| FS a valid backup of any type of filesystem, especially not a tree based
| one.

I've never have a problem doing this with ext2 filesystems.  By comparison
I have had ext2 filesystems totally corrupted by just a power-reset.

But I'm starting to think that with reiserfs, I need to go back to rsync
as the backup mechanism.  Some memory leak and stalling problems with rsync
seem to be fixed, now.

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://phil.ipal.org/     |
-----------------------------------------------------------------
