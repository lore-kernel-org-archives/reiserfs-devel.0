From: Pavel Machek <pavel@ucw.cz>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 12 Sep 2004 22:02:07 +0200
Message-ID: <20040912200207.GA4637@openzaurus.ucw.cz>
References: <20040825233739.GP10907@legion.cup.hp.com> <20040825234629.GF2612@wiggy.net> <1093480940.2748.35.camel@entropy> <20040826044425.GL5414@waste.org> <1093496948.2748.69.camel@entropy> <20040826053200.GU31237@waste.org> <20040826075348.GT1284@nysv.org> <20040826163234.GA9047@delft.aura.cs.cmu.edu> <Pine.LNX.4.58.0408260936550.2304@ppc970.osdl.org> <4141FF13.8030009@techsource.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21836-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4141FF13.8030009@techsource.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timothy Miller <miller@techsource.com>
Cc: Linus Torvalds <torvalds@osdl.org>, Jan Harkes <jaharkes@cs.cmu.edu>, Markus =?iso-8859-2?Q?T=F6rnqvist?= <mjt@nysv.org>, Matt Mackall <mpm@selenic.com>, Nicholas Miell <nmiell@gmail.com>, Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Hi!

> Say there's a way to cd into a tgz file to look around.  If the 
> access methods through the kernel get routed back to a user-space 
> process (which probably does some amount of caching in memory and on 
> disk of uncompressed bits of the archive), it could be a bit slower 
> than if it were all in-kernel.  The thing is that the processing time 

Exactly. See uservfs.sf.net. It is using coda hooks into the kernel.

> be done in userspace.)  Besides, even if it were a LOT slower to 
> access a tgz file without extracting it first, I would STILL think it 
> was wonderful AND use it a LOT.

Go ahead :-).


-- 
64 bytes from 195.113.31.123: icmp_seq=28 ttl=51 time=448769.1 ms         

