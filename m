From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] ReiserFS v3 I/O error handling
Date: Wed, 15 Sep 2004 07:31:12 -0700
Message-ID: <41485230.1080002@namesys.com>
References: <41461B2F.7080100@suse.com> <20040915131133.GD5137@backtop.namesys.com> <41484801.2000204@suse.com> <20040915141202.GF5137@backtop.namesys.com> <41485220.7050602@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41485220.7050602@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Alex Zarochentsev <zam@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Jeff Mahoney wrote:

> Alex Zarochentsev wrote:
> |> I assume that was tested with some simulated i/o errors, wasn't it?.
>
> Of course. The debugging code is since removed, but every place there
> was a !buffer_uptodate(bh) check, I added a trigger such that I could
> trigger each error path individually. I triggered various error paths
> while running fsx, stress.sh, and/or ltp's fsstress.

Your patch is much needed stuff.  Would be nice to see it for reiser4 
someday.....;-)

>
> -Jeff
>
> --
> Jeff Mahoney
> SuSE Labs

