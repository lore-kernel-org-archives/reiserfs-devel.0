From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 10:12:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408271010300.10272-100000@chimarrao.boston.redhat.com>
References: <412EEB75.1030401@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20918-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412EEB75.1030401@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Fri, 27 Aug 2004, Hans Reiser wrote:

> Why are you guys even considering going to any pain at all to distort 
> semantics for the sake of backup?  tar is easy, we'll fix it and send in 
> a patch. 

Because not everybody uses tar.  Quite a few people use a
network backup system, while others use duplicity, RPM uses
cpio internally and big companies tend to use proprietary
network backup suites.

Breaking people's setup is something to worry about.

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

