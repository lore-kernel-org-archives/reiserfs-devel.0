From: Jan De Luyck <lkml@kcore.org>
Subject: Re: [2.4.18]: Reiserfs: vs-2120: add_save_link: insert_item returned -28
Date: Fri, 9 Jan 2004 18:00:55 +0100
Message-ID: <200401091800.55426.lkml@kcore.org>
References: <200401091622.41352.lkml@kcore.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16440-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200401091622.41352.lkml@kcore.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-list@namesys.com

On Friday 09 January 2004 16:22, Jan De Luyck wrote:
> Hello list,
>
> Today I discovered I could no longer create files on one of my boxes, which
> still runs 2.4.18 (box is too far away to upgrade right now). It gives me
> 'disk full' messages.
>
> The following message is all over my logs since January 3:
>
> vs-2120: add_save_link: insert_item returned -28
>
> I can't seem to find much on this issue, is this a bug in reiserfs (which
> is fixed in a later version)? Is something wrong with the fs itself?
>
> Thanks for answers.

Nevermind this... I was looking at the wrong partition... for half an hour.... 

:-(

Jan
-- 
My apologies if I sound angry.  I feel like I'm talking to a void.
	-- Avery Pennarun

