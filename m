From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 07 Sep 2004 21:38:31 -0400 EDT
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <89861950490-BeMail@cr593174-a>
References: <200409072102.i87L2K4u005503@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <200409072102.i87L2K4u005503@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: spam@tnonline.net, christer@weinigel.se, ninja@slaphack.com, tonnerre@thundrix.ch, torvalds@osdl.org, pavel@ucw.cz, jamie@shareable.org, cw@f00f.org, viro@parcelfarce.linux.theplanet.co.uk, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com, reiser@namesys.com

Horst von Brand wrote on Tue, 07 Sep 2004 17:02:20 -0400:
> Hans Reiser <reiser@namesys.com> said:
> > Or, we can ask Alexander to help us use his deadlock detection algorithm 
> > and try to do things right....
> 
> Good luck with that one. I'd suspect if it can be made to work, it will
> have _huge_ overhead, so much that it is useless. I'd love to be proven
> wrong, but I won't hold my breath.

Depends if you consider it to be a huge overhead to lock all the objects
that are ancestors (possibly through cyclical multiple parents) of the
fildirute (file/directory/attribute/whatever) being deleted/renamed.
It could definitely be a lot if you have some weird worst case directory
layout with lots of parent directories.  But that's rare (most users
don't have that many directories anyway).

By the way, the deadlock system I was using is just a hack - a timeout
on the locking semaphores for each file.  If it fails to lock everything
it needs, it backs off, waits a while, tries again, and eventually
reports EDEADLK if it exhausts the retry count.

Well, actually it's a bit fancier - it read-locks the file nodes as it
is traversing the graph to find all ancestors.  Then when it has finished,
it write-locks the ones it needs to change.

- Alex
