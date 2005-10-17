From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 and laptop_mode
Date: Mon, 17 Oct 2005 18:04:01 -0500
Message-ID: <43542DE1.7050700@slaphack.com>
References: <19812996093.20051017162429@usu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26554-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <19812996093.20051017162429@usu.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sinitsyn Valentine <Valentine.Sinitsyn@usu.ru>
Cc: reiserfs-list@namesys.com

Sinitsyn Valentine wrote:
> Hi all,
> 
> I'm considering installing Reiser4 on my laptop, but I also want to
> use laptop_mode (http://www.xs4all.nl/~bsamwel/laptop_mode/index.html)
> to save battery power. So I'm wondering wether these two products are
> compatible with each other? I know that Reiser3 and ext3 did require
> special patches (now included in mainstream kernels) which schedule
> commits in a way which allows hard drive to spin down. I've looked
> through Google and this mailing list but didn't find any references to
> similar patches for Reiser4. Are they needed but nobody wrote them yet
> or is Reiser4 spindown-friendly just out of the box?

Reiser4 is spindown-friendly in one way -- until you run out of RAM, it
won't commit.  In fact, if you have enough RAM, you won't ever touch the
disk -- deleting a file before it's committed means it never touches disk.

It is not as spindown-friendly as laptop_mode, which notices when the
drive has to spin up anyway (maybe through a read) and flushes all
writes.  Don't know if they are compatible.
