From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 12:23:41 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408261217140.2304@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408261457320.27909-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20767-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408261457320.27909-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>
Cc: Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Thu, 26 Aug 2004, Rik van Riel wrote:
> 
> Hmmm, I just straced  "cp /bin/bash /tmp".
> One line stood out as a potential problem:
> 
> open("/tmp/bash", O_WRONLY|O_CREAT|O_LARGEFILE, 0100755) = 4
> 
> What do we do with O_CREAT ?
> 
> Do we always allow both a directory and a file to be created with
> the same name ?

Either I am confused, or you are.

To me, a filesystem that allows this thing doesn't really _have_ the 
concept of "directory vs file". It's just a "filesystem object", and it 
can act as _both_ a directory and a file.

So when you create "/tmp/bash" - assuming /tmp supports the file-as-dir 
semantics at all, you're just creating a new inode - the same you always 
have. When you write to that inode, it writes to the default stream. 
There's no special cases here.

Now, after you have your regular /tmp/bash, you can then start adding 
named streams to it, ie you can do

	open("/tmp/bash/icon", O_WRONLY|O_CREAT|O_LARGEFILE, 0755);

and that will create the "icon" named stream. See? 

So "/tmp/bash" is _not_ two different things. It is _one_ entity, that
contains both a standard data stream (the "file" part) _and_ pointers to
other named streams (the "directory" part).

Hey, think of it as a wave-particle duality. Both "modes" exist at the
same time, and cannot be separated from each other. Which one you see
depends entirely on your "experiment", ie how you open the file.

> Does this create a new class of "symlink attack" style security
> holes ?

I don't believe so. 

		Linus
