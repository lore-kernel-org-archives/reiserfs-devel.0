From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 11:46:33 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408261132150.2304@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com>
 <200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Cc: Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Thu, 26 Aug 2004, Denis Vlasenko wrote:
> 
> Is it possible to sufficiently hide "dirs inside files"
> so that old tools will be unable to see them?

Certainly possible.

> I just checked:
> 
> ls -d /foo  does lstat64("/foo", ...)
> ls -d /foo/ does lstat64("/foo", ...)
> 	but
> ls -d /foo/. does lstat64("/foo/.", ...)
> 
> Will it work out if "dir inside file" will only be visible when referred as "file/."?

That would likely be the _easiest_ approach for the kernel, and does solve 
the problem with some apps knowingly removing the trailing '/'.

Note that we could try this out with existing filesystems with very 
minimal changes:

 - make directory bind mounts work on top of files ("graft_tree()")
 - make open_namei() and friend _not_ do the mount-point following for the 
   last component if it's a non-directory.
 - probably some trivial fixups I haven't thought about. There might be 
   some places that use "S_ISDIR()" to check for whether something can be 
   looked up, but the main path walking already just checks whether there
   is a ".lookup" operation or not.

This would already allow people to "try out" how different applications 
would react to a file that can show up both as a directory and a file. The 
patch might end up being less than 25 lines or so, the difficulty is in 
finding all the right places.

Al, anything I missed?

(And yes, it's a quick hack, but it's a quick hack that would probably
mimic a good part of what we would have to do internally in the VFS layer
to support this notion anyway).

		Linus
