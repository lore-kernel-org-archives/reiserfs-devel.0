From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 11:55:07 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408261149510.2304@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408261440550.27909-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20760-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408261440550.27909-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>
Cc: Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Thu, 26 Aug 2004, Rik van Riel wrote:
> 
> So you'd have both a file and a directory that just happen
> to have the same name ?  How would this work in the dcache?

There would be only one entry in the dcache. The lookup will select 
whether it opens the file or the directory based on O_DIRECTORY (and 
usage, of course - if it's in the middle of a path, it obviously needs to 
be opened as a directory regardless).

That's not the problem. The problem from a dcache standpoint ends up being 
when the file has a link, and you have two paths to the same sub-file 
through two different ways:

	.. create file 'x' with named stream 'y' ...
	ln x z
	ls -l x/y z/y	/* it's the same attribute!! */

but this is actually exactly the same thing that we already have with 
mounts, ie it is equivalent (from a dentry standpoint) to

	.. create directory 'x' with file 'y' ..
	mkdir z
	mount --bind x z
	ls -l x/y z/y	/* It's the same file!! */

so none of this is really anything "new" from a dcache standpoint.

Except for all the details, of course ;)

		Linus
