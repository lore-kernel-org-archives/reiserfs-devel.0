From: Hans Reiser <reiser@namesys.com>
Subject: Re: flush earlier?  (was Re: Congratulations! we have got hash function
 screwed up)
Date: Fri, 07 Jan 2005 15:52:08 -0800
Message-ID: <41DF20A8.20506@namesys.com>
References: <20041228221218.GA6412@schmorp.de> <20050106124505.GE5352@backtop.namesys.com> <20050106142706.GE519@schmorp.de> <41DD5FA9.5020800@namesys.com> <1967462673.20050106171323@tnonline.net> <20050106162619.GG18173@ZenIV.linux.org.uk> <41DEC53A.40403@namesys.com> <41DF1AE1.8090306@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41DF1AE1.8090306@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Chris Dukes <pakrat@www.uk.linux.org>, Spam <spam@tnonline.net>, reiserfs-list@namesys.com

David Masover wrote:

> Hans Reiser wrote:
> | Chris Dukes wrote:
> |
> |>
> |>
> |> All filesystems will fail or suffer degraded performance under
> |> certain conditions, you need to determine what conditions are 
> acceptable
> |> for your data.
> |>
> |>
> |>
> | and each generation of software reduces the extent of such conditions.
> | Reiser4 fixes this problem cleanly.
>
> I think Reiser4's degraded performance condition is when it gets lots of
> RAM.  First, a disclaimer -- I don't have the latest reiser4 patch.  But
> in all versions of the FS, I've found that if I'm ever trying to do
> anything when reiser finally decides to flush to disk, basically my
> whole system is locked up.  I haven't tested, but I think this would
> actually be worse with more RAM, because it would be longer until the
> flush was forced, so each flush would take longer.
>
> What is needed is some sort of estimator or estimate.  An estimator
> would be something that would flush when, based on recent fs load, it
> was reasonable to expect that RAM would fill up just as the flush was
> completing.  An estimate would be to flush if a certain percentage of
> RAM was full, and to go to synchronous mode if memory usage didn't go
> back below that percentage.

We need to throttle rather than flush, so as to ensure that for every 
page added to an atom, at least X pages must reach disk, until close to 
the end of the atom when we just flush it out.

Another missing and needed feature....

Hans
