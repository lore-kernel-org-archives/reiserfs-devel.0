From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] ReiserFS v3 I/O error handling
Date: Tue, 21 Sep 2004 13:46:32 -0400
Message-ID: <1095788792.28057.232.camel@watt.suse.com>
References: <41461B2F.7080100@suse.com>
	 <20040915131133.GD5137@backtop.namesys.com> <41484801.2000204@suse.com>
	 <20040915141202.GF5137@backtop.namesys.com> <41485220.7050602@suse.com>
	 <41485230.1080002@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21865-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41485230.1080002@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Jeff Mahoney <jeffm@suse.com>, Alex Zarochentsev <zam@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Wed, 2004-09-15 at 10:31, Hans Reiser wrote:
> Jeff Mahoney wrote:
> 
> > Alex Zarochentsev wrote:
> > |> I assume that was tested with some simulated i/o errors, wasn't it?.
> >
> > Of course. The debugging code is since removed, but every place there
> > was a !buffer_uptodate(bh) check, I added a trigger such that I could
> > trigger each error path individually. I triggered various error paths
> > while running fsx, stress.sh, and/or ltp's fsstress.
> 
> Your patch is much needed stuff.  Would be nice to see it for reiser4 
> someday.....;-)

;-) Any objections if we start by sending this to Andrew for v3?

-chris


