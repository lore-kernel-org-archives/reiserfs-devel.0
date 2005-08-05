From: PFC <lists@boutiquenumerique.com>
Subject: Re: recovering from "rm -rf"
Date: Fri, 05 Aug 2005 23:36:29 +0200
Message-ID: <op.su10y3q7th1vuj@localhost>
References: <42F3A08A.30102@planet.nl> <42F3A16D.6090306@namesys.com> <42F3C73B.9040808@slaphack.com> <b14e81f0050805135739c94933@mail.gmail.com> <42F3D760.7090008@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25313-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F3D760.7090008@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: David Masover <ninja@slaphack.com>, michael chang <thenewme91@gmail.com>
Cc: reiserfs-list@namesys.com


> Drive A is a 500 gig striped RAID.  Drive B is a 200 gig IDE drive.  I
> mv'ed all my data (about 100 gigs) from drive A to drive B.  Drive B
> then had its power plug fall out (don't ask me how I managed that), I
> plugged it back in (stupid!) -- there was a spark -- drive B now won't
> spin up, and drive A is essentially "rm -rf"ed.

	You probably fried the electronics... if the heads are still OK, you  
could recover your data by exchanging the PCB from a brand new drive, with  
the fried PCB of the old drive. You need some electronics skillz, but a  
friend of mine did this (it was an adventure, as he had to find the same  
drive as he had, from ebay, etc) and it worked for him... if something  
that's not on the PCB is dead, well, you need a recovery company.
	Or you could give $25 to Hans Reiser via his website for an answer ?
