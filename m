From: Russell Coker <bofh@coker.com.au>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Tue, 15 Oct 2002 16:46:19 +0200
Message-ID: <200210151646.19633.bofh@coker.com.au>
References: <200210121052.22603.bofh@coker.com.au> <200210151457.58520.bofh@coker.com.au> <3DAC1B38.40101@namesys.com>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DAC1B38.40101@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Wedgwood <cw@f00f.org>, reiserfs-list@namesys.com

On Tue, 15 Oct 2002 15:42, Hans Reiser wrote:
> Russell Coker wrote:
> >See the following graph:
> >http://www.coker.com.au/~russell/hardware/46g.png
> >
> >This shows testing a single 46G drive, two drives on different buses at
> > the same time, and two drives on the same bus at the same time.  zcav
> > (part of Bonnie++) was used to perform the tests.
>
> I am surprised that separating them onto different buses has so little
> effect.  It looks like most of the bottleneck for large reads off two
> drives is not the IDE bus, but something else (maybe CPU or memory
> bandwidth).

I was surprised too.  Especially as it's an ATA-66 bus (the bus was expected 
to be a bottleneck).

Only a single CPU.

I would like to do more research on this matter and write a magazine article 
(I already have a magazine wanting to publish it).  All I need is suitable 
access to the latest hardware to perform my tests (tests on old hardware 
while still being interesting research doesn't sell magazines).

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

