From: Chris Worley <cworley@symbionsys.com>
Subject: Re: SUSE 9.1 with ReiserFS:  / won't fsck, but is otherwise fine
Date: Fri, 24 Sep 2004 07:56:31 -0600
Message-ID: <1096034190.17001.14.camel@xserver.local.net>
References: <1095996040.10293.18.camel@xserver.local.net>
	 <200409241116.09066.vitaly@namesys.com>
	 <1096032016.17001.4.camel@xserver.local.net>
	 <20040924133052.GA1617@hvs.envisage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21903-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040924133052.GA1617@hvs.envisage.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Fri, 2004-09-24 at 07:30, Hendrik Visage wrote:
> 1) Why do you *want* to fsck a reiserfs? Unless you have troubles, then a
> fsck on a reiserfs is not needed by design of a logging/journaling fs

You don't have a choice on the root file system... fsck will be run.

Once booted, I am just running a ro fsck of / (on a rw mounted file
system).

If there's really nothing wrong with the FS, then I'm okay just making a
no-op fsck.reiserfs and leaving it at that... I'm just worried that
something is really wrong with the file system, and I need to fix that. 
As it sits atop an LVM, I want to add a few more partitions to the LVM
and extend the Reiser fs... but I'm paranoid, with this error, to
proceed.

> 2) any fsck needs to be done on a read-only mounted fs, 

Which is the state when fsck is run during boot.  I get the same error
when booting and dropping into fsck mode as I do after the system is
booted.

> and then if
> anything have been fixed, that fs preferably needs to be umounted (see the
> trouble with / already mounted) and mounted again to makesure the caches etc.
> is cleared.

If the Reiser tools would just recognize this as a fs, I'd be satisfied.

Thanks,

Chris

