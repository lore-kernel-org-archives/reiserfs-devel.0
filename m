From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] reiserfs v3 fixes and features
Date: Fri, 16 Apr 2004 14:54:26 -0400
Message-ID: <1082141666.27614.1448.camel@watt.suse.com>
References: <1081274618.30828.30.camel@watt.suse.com>
	 <1081989006.27614.110.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18003-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081989006.27614.110.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-list@namesys.com


Hello all,

I've uploaded some new code to:

ftp.suse.com/pub/people/mason/patches/reiserfs/2.6.5-mm6

Only reiserfs-group-alloc-9 has changed.

preallocation now enforces minimum allocations too, which cuts down on
fragmentation when applications send small writes.

The mount options are slightly different.  mount -o packing_groups
changed to mount -o alloc=packing_groups.  This makes the new options
more consistent and easier to control via remount and such.

More importantly, the default has changed too.  Once you apply
reiserfs-group-alloc-9, the default is:

mount -o alloc=skip_busy:dirid_groups:packing_groups

If you want the old default:

mount -o alloc=skip_busy

Both reiserfs-group-alloc-9 and reiserfs-search-reada-5 should be stable
now, at least I haven't been able to trigger problems with them in -suse
or -mm.

-chris


