From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfs keeps failing fsck suggested reiserfsck --rebuild-sb
Date: Mon, 28 Apr 2003 09:48:01 +0400
Message-ID: <20030428054801.GD22902@namesys.com>
References: <1051501483.850.22.camel@sarantium>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13845-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1051501483.850.22.camel@sarantium>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Epperly <tomepperly@attbi.com>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Apr 27, 2003 at 08:44:43PM -0700, Tom Epperly wrote:

> I recently upgraded to reiserfsprogs 3.6.6-1 via the normal "apt-get
> update ; apt-get upgrade". Since then, fsck has been failing when I
> reboot. I've tried running "reiserfsck --rebuild-sb" as directed, but I
> get the same message again when I reboot.
> My of my dialog with the Debian maintainer is here:
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=190963

Hm, there you say that you was able to solve the problem.

> I've run reiserfsck --rebuild-sb on all the reiserfs partitions. It
> never says anything to indicate that it did or didn't do anything. It
> would be nice to see something like "super block updated" or "no change
> needed", but that's kind of beside the point.
> When I reboot after running reiserfsck --rebuild-sb on all the reiserfs
> partitions, it fails in fsck in the same way with the same message. It
> is as though reiserfsck isn't doing anything or is not doing the right
> thing.

Hm.
What questions were presented to you and what have you answered to those (when you run
reiserfsck --rebuild-sb on your partitions)?

Bye,
    Oleg
