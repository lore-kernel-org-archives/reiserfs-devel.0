From: Chris Mason <mason@suse.com>
Subject: Re: new data logging patches available
Date: 09 May 2003 08:08:31 -0400
Message-ID: <1052482111.14612.737.camel@tiny.suse.com>
References: <1052400138.14612.483.camel@tiny.suse.com>
	 <200305090837.22969.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14043-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305090837.22969.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

On Fri, 2003-05-09 at 02:37, Christian Mayrhuber wrote:

> > 03-relocation-8.diff is also updated, I believe it will fix the bug
> > where md reports the device is busy during reboot.  It has not been
> > tested on a box with a software raid root device, so please handle with
> > care.
> Yes, relocation-8 fixes the MD root device issue. /dev/md0 can switch to
> read only mode and do a shutdown afterwards.

Thanks for testing, and for your help in tracking down the problem.

-chris


