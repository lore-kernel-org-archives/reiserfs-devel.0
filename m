From: Chris Mason <mason@suse.com>
Subject: Re: reiserfsprogs 3.6.18 release
Date: Tue, 03 Aug 2004 13:00:42 -0400
Message-ID: <1091552442.6207.327.camel@watt.suse.com>
References: <200408032014.33703.vitaly@namesys.com>
	 <200408031826.30243.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19949-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408031826.30243.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

On Tue, 2004-08-03 at 12:26, Christian Mayrhuber wrote:
> On Tuesday 03 August 2004 18:14, Vitaly Fertman wrote:
> > - handle suse's block allocator changes correctly;
> 
> Does this mean older reiserfsck's may eat fs's with data
> written by kernel 2.6.7 or above?

No, the block allocator was fixed before going into 2.6.7.  Some
versions of -mm had the buggy code.

-chris


