From: Oleg Drokin <green@namesys.com>
Subject: Re: filesystem corruption ?
Date: Thu, 20 Mar 2003 20:06:39 +0300
Message-ID: <20030320200639.A8618@namesys.com>
References: <200303201725.14039.bernd-schubert@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13306-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303201725.14039.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@web.de>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Mar 20, 2003 at 05:25:13PM +0100, Bernd Schubert wrote:

> We use this filesystem a nfs-root-fs to several clients (exported as 
> read-only), so we are lucky, since we regularly backup the whole partition. 
> We have a backup from this Morning and another one from Monday. Based on 
> comparing the output of md5sum we can't find any problems between the version 
> from monday and the version of this morning, *but* there are differences for 
> some binaries in /usr/bin, such as gdb, between the backup of this Morning 
> and the Current files.

Hm, interesting.
And what are the differences? How big are they?
Anything interesting in logs?
Any events happening between morning backup and time of problem discovery?

> Do you have any ideas whats going wrong and what we can do?

We need more info.
Also check modification date of gdb, may be some process changed it?

Bye,
    Oleg
