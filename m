From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: metadata plugins (was Re: the " 'official' point of view"
 expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Fri, 28 Jul 2006 09:33:56 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0607280859380.4168@g5.osdl.org>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl>
 <44CA31D2.70203@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29234-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CA31D2.70203@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, Jeff Garzik <jeff@garzik.org>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>



On Fri, 28 Jul 2006, David Masover wrote:
> 
> But what's wrong with people doing such experiments outside the kernel?
> AFAICS, "exotic, site-specific one" is not something that would be considered
> for inclusion.

Here's a few ground rules at least from my viewpoint:

 - as long you call them "plugins" and treat them as such, I (and I 
   suspect a lot of other people) are totally uninterested, and in fact, a 
   lot of people will suspect that the primary aim is to either subvert 
   the kernel copyright rules, or at best to create a mess of incompatible 
   semantics with no sane overlying rules for locking etc.

 - the kernel does not, and _will_ not, support "hooks" that aren't 
   actually used (and make sense) by normal kernel uses, for largely the 
   same reasons. Interfaces need to be architected, make sense, and have 
   real and valid GPL'd uses.

In other words, if a filesystem wants to do something fancy, it needs to 
do so WITH THE VFS LAYER, not as some plugin architecture of its own. We 
already have exactly the plugin interface we need, and it literally _is_ 
the VFS interfaces - you can plug in your own filesystems with 
"register_filesystem()", which in turn indirectly allows you to plug in 
your per-file and per-directory operations for things like lookup etc.

If that isn't enough, then the filesystem shouldn't make its own internal 
plug-in architecture that bypasses the VFS layer and exposes functionality 
that isn't necessarily sane. For example, reiser4 used to have (perhaps 
still does) these cool files that can be both directories and links, and I 
don't mind that at all, but I _do_ mind the fact that when Al Viro (long 
long ago) pointed out serious locking issues with them, those seemed to be 
totally brushed away.

So as far as I'm concerned, the problem with reiser4 is that it hasn't 
tried to work with the VFS people. Now, I realize that the main VFS people 
aren't always easy to work with (Al and Christoph, take a bow), but that 
doesn't really change the basic facts. Al in particular is _always_ right. 
I don't think I've ever had the cojones to argue with Al..

			Linus
