From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Sat, 29 Mar 2003 13:04:58 +0100
Sender: bernd-schubert@web.de
Message-ID: <200303291304.58675.bernd-schubert@web.de>
References: <200303281828.55093.bernd-schubert@web.de> <20030329140145.A24789@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13428-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030329140145.A24789@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: nfs@lists.sourceforge.net, reiserfs-list@namesys.com

>
> We do not yet understand on how to reproduce that locally, because this
> message indicates pretty strange conditions.

Oh, I just logged in from home and checked the logfiles and saw that 
/usr/sbin/logrotate is affected as well. However, this time the clients don't 
get I/O-errors for this file, its only the server that reports the problems.

Well, if you like, I could provide you a dd-image of this partition, though 
its rather large (19GB).


Bernd
