From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 01:45:49 +0400
Message-ID: <16686.23053.559951.815883@thebsh.namesys.com>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com>
	<200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua>
	<20040826193617.GA21248@arlut.utexas.edu>
	<20040826201639.GA5733@mail.shareable.org>
	<1093551956.13881.34.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093551956.13881.34.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christophe Saout <christophe@saout.de>
Cc: Jamie Lokier <jamie@shareable.org>, Jonathan Abbey <jonabbey@arlut.utexas.edu>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Christophe Saout writes:
 > Am Donnerstag, den 26.08.2004, 21:16 +0100 schrieb Jamie Lokier:
 > 
 > > > | Will it work out if "dir inside file" will only be visible when
 > > > referred as "file/."?
 > > > 
 > > > I'm used to using ls symlink/. to get ls to show me the directory on
 > > > the far side of a symbolic link.  That's a pretty analagous case to
 > > > the one we're discussing here, I think?
 > > 
 > > By the way, do symlinks have metadata?  Where do you find it? :)
 > 
 > Oops. :)
 > 
 > At least in reiser4 they don't have, or at least you can't access them.

They do.

 > ln -s foo bar; cd bar/metas shows me the content of foo/metas.

That's because lookup for "bar" performs symlink resolution.
 
 > 
 > symlinks are special anyway. Their rights are 777. The only thing they

Symlink is represented by normal inode in UNIX. It has full set of
attributes. It can even be hard-linked.

 > can have is an owner. No chance to do a symlink/metas/uid then. Hmm.
 > 

Nikita.
