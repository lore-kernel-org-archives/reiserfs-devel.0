From: Christer Weinigel <christer@weinigel.se>
Subject: Re: silent semantic changes with reiser4
Date: 26 Aug 2004 13:16:31 +0200
Sender: wingel@zoo.weinigel.se
Message-ID: <m3llg2m9o0.fsf@zoo.weinigel.se>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
	<20040825152805.45a1ce64.akpm@osdl.org>
	<112698263.20040826005146@tnonline.net>
	<Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org>
	<1453698131.20040826011935@tnonline.net>
	<20040825163225.4441cfdd.akpm@osdl.org>
	<20040825233739.GP10907@legion.cup.hp.com>
	<20040825234629.GF2612@wiggy.net>
	<1939276887.20040826114028@tnonline.net>
	<20040826024956.08b66b46.akpm@osdl.org>
	<839984491.20040826122025@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20632-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <839984491.20040826122025@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Spam <spam@tnonline.net> writes:

>   Keeping stuff in the kernel should make the new features
>   transparent to the applications.

No, it will make just one special case, rename within the same
filesystem, work.  (Well, two special cases, rm will also delete
the other forks). 

Unless we add a new copy(2) syscall (which would be nice for other
reasons) all applicatons that copy files will fail to copy the
streams.  So no working cp command, no nautilus nor konqueror without
changes to the application.  And if you have to change the
applications anyway, isn't it much better to agree on a shared library
in userspace that everyone uses?  Which has the added bonus that it
can be made to work on top of Linux, Windows, Ultrix and VMS?

  /Christer

-- 
"Just how much can I get away with and still go to heaven?"

Freelance consultant specializing in device driver programming for Linux 
Christer Weinigel <christer@weinigel.se>  http://www.weinigel.se
