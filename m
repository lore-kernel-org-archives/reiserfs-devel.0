From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:13:33 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408261402400.2304@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com><Pine.LNX.4.58.0408261101110.2304@ppc970.osdl.org>
 <45010000.1093553046@flay> <Pine.LNX.4.58.0408261348500.2304@ppc970.osdl.org>
 <57730000.1093554054@flay>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20807-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <57730000.1093554054@flay>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin J. Bligh" <mbligh@aracnet.com>
Cc: Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Thu, 26 Aug 2004, Martin J. Bligh wrote:
> 
> I think what you're saying is that they'd both return positive, right?

No. I'd say that a file would look like a file, even if it has attributes.

It wouldn't show as a directory at all - unless you start looking at 
attributes. Because it really _is_ a file, and it's "directory aspect" is 
really nothing but a way to make its named streams visible.

So you really should consider it a perfectly regular file, and so only 
S_ISREG() will return true, and S_ISDIR() will return false.

Think of it this way: when you add a named attribute to current files 
using the xattr interfaces, do you start thinking of the file as a 
directory? No. Even though it actually now is a starting point for finding 
more information.

It's just that thanks to it's directory aspect, people and apps that 
_care_ about the attributes suddenly can trivially access them. You can 
access them in shell scripts, you can access them in programs, you can 
access them in perl. With no special knowledge necessary.

Remember: in the file-as-directory model, we're always talking about just 
_one_ object. That one object just happens to have namd streams or 
attributes or whatever you want to call them associated with it, and you 
can _see_ them through the normal directory interfaces. But that doesn't 
really make the object a "directory". It's still a file.

In other words, the "directory" part is just a _view_ into the file. A
view that potentially exposes a lot _more_ of the file, but we're still
talking about the same file.

In contrast, a S_IFDIR-like _directory_ is something else entirely. When 
you view the things in that, you aren't looking at data "inside" the 
directory. You're looking at somethign totally independent.

		Linus
