From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:59:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408261457320.27909-100000@chimarrao.boston.redhat.com>
References: <Pine.LNX.4.58.0408261149510.2304@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20761-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408261149510.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 26 Aug 2004, Linus Torvalds wrote:
> On Thu, 26 Aug 2004, Rik van Riel wrote:
> > 
> > So you'd have both a file and a directory that just happen
> > to have the same name ?  How would this work in the dcache?
> 
> There would be only one entry in the dcache. The lookup will select 
> whether it opens the file or the directory based on O_DIRECTORY (and 
> usage, of course - if it's in the middle of a path, it obviously needs to 
> be opened as a directory regardless).

Hmmm, I just straced  "cp /bin/bash /tmp".
One line stood out as a potential problem:

open("/tmp/bash", O_WRONLY|O_CREAT|O_LARGEFILE, 0100755) = 4

What do we do with O_CREAT ?

Do we always allow both a directory and a file to be created with
the same name ?

Does this create a new class of "symlink attack" style security
holes ?


-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

