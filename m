From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 10:58:54 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408301052040.2295@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com>
 <412F7D63.4000109@namesys.com> <20040827230857.69340aec.pj@sgi.com>
 <1093887838l.11947l.1l@orlando>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21120-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093887838l.11947l.1l@orlando>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Stewart <stewart@parc.com>
Cc: Paul Jackson <pj@sgi.com>, Hans Reiser <reiser@namesys.com>, riel@redhat.com, ninja@slaphack.com, diegocg@teleline.es, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Mon, 30 Aug 2004, Paul Stewart wrote:
> 
> Here's another take on the same theme.  To see attrs on files, one can  
> either use a newly developed application which can use special new  
> syscalls/flags on syscalls a Paul Jackson recommends.  However from an  
> old shell or application one can also open the attribute node on
> /home/myself/foo.txt by checking out /attr/home/myself/foo.txt/, which  
> points to the "as directory" node on the filesystem that foo.txt points  
> to.

This is the same idea as Al Viro's /proc/self/fd/#42/attr issue, except 
yours has two fundamental problem: races and ambiguities.

If you open a filename in some "secondary" tree (be it /proc or //attr or 
whatever) based on the filename in the primary one, you have two issues 
that you need to work out:

 - how do you handle a name change in the primary tree at the same time as 
   lookup
 - how do you handle the ambiguity of
	//attr/usr/bin/emacs/icon
   (is that the "icon" attribute on "/usr/bin/emacs", or is it perhaps the 
   "emacs/icon" attribute on "/usr/bin").

The ambiguity can be handled by saying that attributes only have one
component (ie only the _last_ component of a lookup is the attribute
name). But the race between primary tree and secondary tree cannot be
handled in a normal name-space.

What Al did was to avoid both by "fixing" the attribute lookup point with 
another open - _exactly_ the same way "openat()" handles it. So Al's 
naming convention avoids both the ambiguity and the primary tree name 
change races by first opening the primary tree file, and then explicitly 
using that file as the "anchor" in the secondary tree. He did it in /proc, 
where we obviously already do export an open fd as an anchor-point.

> The strange part of this idea is that the /attr filesystem wouldn't be  
> conventionally browsable.

That may make it non-intuitive to use, but that's not the real problem.  
See above.

		Linus
