From: Chris Mason <mason@suse.com>
Subject: Re: Big Block Device does not format...
Date: Thu, 19 Feb 2004 09:36:22 -0500
Message-ID: <1077201381.2831.0.camel@watt.suse.com>
References: <40348453.8020800@sr-online.de>
	 <200402191638.40028.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16854-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402191638.40028.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Oliver Pabst <opabst@sr-online.de>, reiserfs-list@namesys.com

On Thu, 2004-02-19 at 09:02, Vitaly Fertman wrote:
> On Thursday 19 February 2004 12:39, Oliver Pabst wrote:
> > Hello list,
> 
> Hello Oliver,
> 
> > I try to mkreiserfs /dev/evms/userhomes and /dev/evms/userhomes is a
> > drive-linked evms feature object with a sum of 18.8TB.
> >
> > mkreiserfs /dev/evms/userhomes gives following result:
> >
> > count_blocks: block device too large
> > Aborted
> 
> which reiserfsprogs version do you use?
> would you try the latest one from our ftp site?
> 
The limit for 4k block based filesysytems is 16TB.

Try something with extents, or try on ia64 where you can use bigger
pages.

-chris


