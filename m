From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [ANNOUNCE] Reiser5: Selective File Migration - User Interface
Date: Sun, 4 Oct 2020 11:59:23 +0200
Message-ID: <20201004095922.GC1104@bug>
References: <20200826205216.07BC868EF679@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200826205216.07BC868EF679@huitzilopochtli.metztli-it.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Metztli Information Technology <jose.r.r@metztli.com>
Cc: edward.shishkin@gmail.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Hi!

> > In particular, using this functionality, user is able to push out
> > "hot" files on any high-performance device (e.g. proxy device) and pin
> > them there.

What permissions are normally required for file migration?

> > COMMENT. After ioctl successful completion the file is not necessarily
> > written to the target device! To make sure of it, call fsync(2) after
> > successful ioctl completion, or open the file with O_SYNC flag before
> > migration.

Ok.

> > COMMENT. File migration is a volume operation (like adding, removing a device to/from 
> > a logical volumes), and all volume operations are serialized. So, any attempt to 
> > migrate a file, while performing other operation on that volume will fail. If some 
> > file migration procedure fails (with EBUSY, or other errors), or was interrupted by 
> > user, then it should be repeated in the current mount session. File migration 
> > procedures interrupted by system crash, hared reset, etc) should be repeated in the 
> > next mount sessions.

Dunno. Returning -EBUSY is kind of "interesting" there. I'd expect kernel to queue
the callers, because userland can't really do that easily.

Best regards,
									Pavel


-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
