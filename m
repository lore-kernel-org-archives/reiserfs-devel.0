From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsprogs-3.x.1b severe installation bug
Date: Thu, 11 Apr 2002 17:56:32 +0400
Message-ID: <20020411175632.A1488@namesys.com>
References: <3CB59250.943A3487@esc-electronics.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10031-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CB59250.943A3487@esc-electronics.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Baumgart <frank.baumgart@esc-electronics.de>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Apr 11, 2002 at 03:40:32PM +0200, Frank Baumgart wrote:

> To test some own modifications to the reiserfs tools I
> unpacked reiserfsprogs-3.x.1b.tar.gz and configured it
> with "--prefix=/opt/reiserfs".
> After "make install", indeed the man pages are installed
> correctly into /opt/reiserfs/man but my SYSTEM BINARIES
> in /sbin are overwritten!
> The bug did not appear in around 3.0 where binaries were
> installed into what --prefix told.

This behavior was intentional, but we already understood this is wrong.
Next stable version of reiserfsprogs will correct this.

Bye,
    Oleg
