From: Chris Mason <mason@suse.com>
Subject: Re: Furure of ReiserfsV3?
Date: Wed, 29 Oct 2003 09:14:00 -0500
Message-ID: <1067436839.1632.253.camel@tiny.suse.com>
References: <3F9FC877.9000903@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15930-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F9FC877.9000903@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

On Wed, 2003-10-29 at 09:02, Christian Mayrhuber wrote:
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
>  From my point of view the latest data logging patches seem to behave 
> very solid and are desireable to have in 2.6.x.
> I have no experience with the EA/ACL patches from Jeff Mahoney, but
> SuSE uses them for a long time.
> 
> What can be expected to be seen in reiserfs V3 before reiser4's big 
> time? Or has reiserfs V3 entered a hard feature freeze.

SuSE is actively porting all of this.  Even though I've been saying this
for over a year now, it really is happening ;-)  Basically as we migrate
to 2.6 for our products, we'll be pulling in all the features we added
during the 2.4 kernels.

v3 has a lot of users, so we've no intention of leaving them behind in
the 2.6 series kernels.

-chris


