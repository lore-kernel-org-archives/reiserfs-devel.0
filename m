From: Oleg Drokin <green@namesys.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: Sat, 22 Feb 2003 16:54:06 +0300
Message-ID: <20030222165406.A862@namesys.com>
References: <1045870331.16048.325.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12865-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1045870331.16048.325.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Feb 21, 2003 at 06:32:11PM -0500, Chris Mason wrote:

> ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21 will soon be
> updated with a new set of data logging and quota patches against
> 2.4.21-pre4
> The data logging code is updated with another set of io stalling fixes,
> they should improve performance of data=ordered and data=writeback by
> being smarter about forcing commits under heavy write load and kicking
> kreiserfsd.
> Treat these with care, they've gotten a ton of testing under the suse
> kernel, but the port to vanilla was just done today.
> The quota patches include a fix for incorrect sd_block counts on
> symlinks.

Replacement 05-data-logging-36.diff.gz file that applies to 2.4.21-pre4-ac5
is available at
ftp://namesys.com/pub/reiserfs-for-2.4/testing/05-data-logging-36-ac5.diff.gz
It compiles, boots, survives my (simple) testing. (writing this email
from patched 2.4.21-pre4-ac5, too). Quota works. symlinks are now have correct
blocks count too
The reason for rejects is mostly DIRECTIO fix that also went into current
bk snapshot, so probably it will apply to Marcelo's bk tree, too.
Chris: Is it intended that directio only works on data=writeback
mounted filesystems?

Also following README file diff should be considered:

--- README.orig	Sat Feb 22 16:44:34 2003
+++ README	Sat Feb 22 16:44:49 2003
@@ -28,7 +28,7 @@
 
 These add reiserfs quota support
 
-07-quota-v2-2.4.21.diff.gz
+07-quota-v2-2.4.21.diff.gz # you don't need this on -ac, too
 08-reiserfs-quota-26.diff.gz
 09-kinoded-8.diff.gz
 
