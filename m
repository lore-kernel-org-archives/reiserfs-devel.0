From: Paul Jackson <pj@sgi.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 23:08:57 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040827230857.69340aec.pj@sgi.com>
References: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com>
	<412F7D63.4000109@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <412F7D63.4000109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: riel@redhat.com, ninja@slaphack.com, torvalds@osdl.org, diegocg@teleline.es, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Hans wrote:
> We create filename/pseudos/backup, and that tells the archiver what to 
> do.....

Instead of exposing the old semantics under a new interface, why not
expose the new semantics under a new interface.

There exist plenty of programs that know the old Unix semantics.  There
don't exist many working programs that use the new semantics that you're
adding.

I raise again the example of how Windows adapted to long filenames.  Old
DOS and FAT programs, including my Unix backups of today, see a 8.3 name
space.  Only code that knows the new magic sees the long names.

If given the choice of breaking much old, existing stuff, or some new,
mostly not yet existing stuff, does not it make more sense to break what
mostly doesn't exist yet?

One possible way to do this, of no doubt many:

 * Stealing a corner of the existing filename space for
   some magic names with the new semantics.

 * A new option on open(2), hence opendir(3), that lights up
   these magic names.

 * Doing any of the classic pathname calls with such a
   new magic name exposes the new semantics - such calls
   as:
	access execve mkdir mknod mount readlink
	rename rmdir stat truncate unlink

This means essentially constructing a map between old and new,
such that changes made in either view are sane and visible
from the other view.

-- 
                          I won't rest till it's the best ...
                          Programmer, Linux Scalability
                          Paul Jackson <pj@sgi.com> 1.650.933.1373
