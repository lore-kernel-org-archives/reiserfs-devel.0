From: Chris Mason <mason@suse.com>
Subject: Re: udpated data logging available
Date: 18 Jun 2003 09:56:54 -0400
Message-ID: <1055944613.5545.22.camel@tiny.suse.com>
References: <1055764071.24111.650.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14604-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1055764071.24111.650.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello again,

ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21/experimental

Has two additional patches.  The first is io-stalls-logging-6.diff,
which is very similar to the io stalling code I've been posting on the
linux kernel list.  It's unrelated to reiserfs really, and fixes some
fairness issues at the block device layer.

The second is reiserfs-jh-1, which changes where the lists live for
data=ordered and tail buffers.  It allows us to do a few things:

fdatasync without triggering a commit for tails or data=ordered buffers.
O_DIRECT and data=ordered.
O_DIRECT without special code to make sure tails get flushed.
optimizations on data=ordered write back.

The two O_DIRECT parts aren't coded yet, but I wanted to get this patch
out there for people to try.  The good news is the O_DIRECT stuff
involves removing code instead of adding it, so it is just a matter of
testing.

The reiserfs-jh code is also needed for a worthwhile port to 2.5, it
should make things easier overall from here on.  Handle with care, it's
been through an overnight run, but I make no promises the jh code won't
give you a chance to see how good your backups are.

io-stalling-6 is considered stable, it is just in the experimental
directory because it is not strictly needed for the data logging in
general.

-chris


