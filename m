From: Hans Reiser <reiser@namesys.com>
Subject: Re: Furure of ReiserfsV3?
Date: Wed, 29 Oct 2003 17:12:13 +0300
Message-ID: <3F9FCABD.4010104@namesys.com>
References: <3F9FC877.9000903@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15929-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F9FC877.9000903@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

Christian Mayrhuber wrote:

> Hi,
>
> if someone looks at the feature matrix of the major filesystems in 
> kernel 2.6.0 it tells you the following:
>
> FS        data ordered   EA   ACL   Quota   sec. labels   ext. journal
> ======================================================================
> ext2             N       Y     Y      Y         Y            N
> ext3             Y       Y     Y      Y         Y            Y
> xfs              N       N     Y      Y         N            Y
> jfs              N       N     Y      ?         N            Y
> reiserfs         N       N     N      Y         N            Y
> (reiserfs)       Y*      Y**   Y**    Y         N            Y
>
> * data logging patches by Chris Mason (SuSE)
> ** EA/ACL patches by Jeff Mahoney (SuSE)
>
> The current feature situation does not look great for reiserfs.
> From my point of view the latest data logging patches seem to behave 
> very solid and are desireable to have in 2.6.x.
> I have no experience with the EA/ACL patches from Jeff Mahoney, but
> SuSE uses them for a long time.

We got bug reports for EA/ACLs.  I don't know what the status is of the 
fixes for them because we don't support them. SUSE does.

>
> What can be expected to be seen in reiserfs V3 before reiser4's big 
> time? Or has reiserfs V3 entered a hard feature freeze.

V3 is in feature freeze.  Use it, it won't break as a result of a new 
feature being added to it next month.  The data logging patches are 
probably the last significant change that will go into the vanilla 
kernel (and I would have preferred that they go in quite some time ago 
but.....)

New features are in V4.  It will be stable "real soon now". ;-)

-- 
Hans


