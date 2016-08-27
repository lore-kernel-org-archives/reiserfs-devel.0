From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: How can I list files with accessible inodes [/dev/sdb]
Date: Fri, 26 Aug 2016 23:03:47 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.14.1608262258200.8131@trent.utfs.org>
References: <0529de4b5b9d00bff54fbf8403d9a6f5@mail.velocitynet.com.au> <alpine.DEB.2.20.14.1608251507170.8131@trent.utfs.org> <4646e380301d5ae653196657e9ba4ba0@mail.velocitynet.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4646e380301d5ae653196657e9ba4ba0@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

> http://www.spinics.net/lists/reiserfs-devel/msg03016.html
> 2.6.39.4 with reiser4 enabled.
> Date: Fri, 18 Nov 2011

So, the Reiser4 file system where you see the errors now - it was created 
back in 2011 with kernel 2.6.39.4 - is that what you're saying?

> Date: Sun, 08 May 2011
> http://www.spinics.net/lists/reiserfs-devel/msg02855.html

And then you ran fsck.reiser4 in 2011 (5 years ago!) and the file system 
still shows the same errors? So, at this point I'd have given up and 
restored from backups and simply re-created the file system again :-)

You still haven't answered the following:

> Was the file system accessible with older kernels? (I guess it _was_ 
> accessible back in 2011 with 2.6.39.4, right?

> > * How is your Reiser4 file system mounted? (mount | grep reiser4)
> > * What lead to the errors in the first place? Was there a power outage,
> >   or some other crash?
> > * Does syslog show any underlying device errors? Please use a pastebin
> >   for longer syslog outputs.

C.
-- 
BOFH excuse #328:

Fiber optics caused gas main leak
