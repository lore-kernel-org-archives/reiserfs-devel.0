From: Chris Mason <mason@suse.com>
Subject: [PATCH] reiserfs v3 patches for 2.6.6-rc2
Date: Fri, 23 Apr 2004 15:54:06 -0400
Message-ID: <1082750045.12989.199.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18181-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, akpm@osdl.org

Hello all,

Thanks to Andrew for helping to test and feed many of the reiserfs
patches into mainline.  I've rediffed against the current -mm and linus
trees:

ftp.suse.com/pub/people/mason/patches/reiserfs/2.6.6-rc2

The directory includes a series file to tell you the order to apply the
patches.  The same series file should work with -mm kernels as well
right now.

New in this patch set is data=journal support, which fills out the
compatibility list with the 2.4.x reiserfs data logging patches.  Other
patches include:

xattrs and acls (Jeff Mahoney)
warning/error messages that include device names (Jeff Mahoney)
quotas
block allocator improvements
metadata readahead for some types of tree searches

data=journal is experimental, but most of the code changes don't kick in
unless you mount with data=journal.

The rest of the patches should be stable.

-chris


