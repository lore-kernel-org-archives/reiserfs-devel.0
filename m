From: "Jaroslav Fojtik" <JaFojtik@seznam.cz>
Subject: Re6: Reiserfs3 is crashing - where/whom to report?
Date: Tue, 20 Jan 2009 19:49:09 +0100
Message-ID: <49761CA5.613.41328D@JaFojtik.seznam.cz>
References: <49750FC1.23700.2C929@JaFojtik.seznam.cz>, <49760EC3.25886.AFADA@JaFojtik.seznam.cz>, <49761597.1060305@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-reply-to: <49761597.1060305@gmail.com>
Content-description: Mail message body
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>, Jeff Mahoney <jeffm@suse.com>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Dear Edward,

> > I do not know why these block sizes has been disabled - stability? speed?
> > Overflowing block count?
> >   
> http://bugzilla.kernel.org/show_bug.cgi?id=9108
> 
> Reiserfs has never worked properly with small blocksizes, and it was
> unpleasant surprise when I saw that it is enabled again in
> reiserfsprogs-3.6.19.

> IMHO there is no chances to make reiserfs work with 512K blocks.
Never mind.

> Other cases should be carefully debugged. Put in longterm todo.
OK.

And make it sense for you to make a test on my HDD with blocksize 1024 
and report you a problem? At least one known crash could be avoided.

Jara

