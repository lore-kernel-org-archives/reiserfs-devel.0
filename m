From: Chris Mason <mason@suse.com>
Subject: reiserfs v3 patches updated
Date: Mon, 05 Apr 2004 20:10:39 -0400
Message-ID: <1081210239.4994.69.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17737-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello everyone,

These aren't really data=ordered specific anymore, so I've moved them
around a little in my ftp directory.  You can download the set of
experimental reiserfs v3 patches from:

ftp://ftp.suse.com/pub/people/mason/patches/reiserfs/2.6.5

Since some of these are in -mm and some are not, there are two series
files.  series.linus gives you the patches needed for mainline 2.6.5,
and series.mm gives you the patches needed for 2.6.5-mm1

Most of these are from Jeff Mahoney and I, they include:

bug fixes
logging optimizations
data=ordered support
xattrs
acls
quotas
error messages with device names (based on Oleg's 2.4 patch)
block allocator improvements

Hans, could you please comment on the xattr and acl patches?  Something
more substantial then "I don't want xattrs in v3" is needed.  If there
is some technical objection to the patches I'd really like to discuss
it.

The block allocator improvements is our attempt to reduce
fragmentation.  The patch defaults to the regular 2.6.5 block allocator,
but has options documented at the top of the patch that allow grouping
of blocks by packing locality or object id.  It also has an option to
inherit lightly used packing localities across multiple subdirs, which
keeps things closer together in the tree if you have a bunch of subdirs
without much in them.

If anyone is interested in experimenting with the block allocator stuff,
please let me know.

-chris


