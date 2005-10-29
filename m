From: Hans Reiser <reiser@namesys.com>
Subject: Re: [2.6 patch] fs/reiser4/: possible cleanups
Date: Sat, 29 Oct 2005 09:09:04 -0700
Message-ID: <43639EA0.5080300@namesys.com>
References: <20051028223547.GF4180@stusta.de> <df47b87a0510282058t37e8393o60e7f592ea5b19e5@mail.gmail.com> <20051029092250.GG4180@stusta.de> <op.szejazspth1vuj@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26711-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.szejazspth1vuj@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: PFC <lists@boutiquenumerique.com>, Alexander Zarochentcev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

PFC wrote:

>
>     Remember my message where I said reiser4 was preventing my laptop
> from  shutting down itself ?
>
>     Well it turned out that, in fact, it was a stupid shfs-mount
> process  which would refuse to die. Adding a "killall ssh" in the
> local.stop script  is a bit violent, but perfectly functional way, to
> bring it back to  reason. Everything now works.
>
>     But still, I had to fsck --rebuild-tree just because my battery
> ran out...
>
>
>
the battery running out should not have caused you to need to do that.

zam, can you do some testing of how well we handle power cord yanking
while under load?  There are some guys at stanford who have some test
programs for this sort of thing, I wish I could remember their name at
the moment....

Hans
