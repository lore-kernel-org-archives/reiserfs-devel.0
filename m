From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 22:19:18 +0100
Message-ID: <20040826211918.GF5733@mail.shareable.org>
References: <Pine.LNX.4.44.0408261152340.27909-100000@chimarrao.boston.redhat.com> <1093536282.5482.6.camel@leto.cs.pocnet.net> <Pine.LNX.4.60.0408261348370.27825@dlang.diginsite.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20810-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.60.0408261348370.27825@dlang.diginsite.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Lang <david.lang@digitalinsight.com>
Cc: Christophe Saout <christophe@saout.de>, Rik van Riel <riel@redhat.com>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

David Lang wrote:
> I also don't see why the VFS/Filesystem can't decide that (for example) 
> this tar.gz is so active that instead of storing it as a tar.gz and 
> providing a virtual directory of the contents that it instead stores the 
> directory of the contents and makes the tar.gz virtual (regenerating it as 
> needed or as extra system resources are available)

Absolutely.  It could keep both views, if they're both actively being
used.  Or more than both, if there are more.  (You could think of
compression being an alternate view, and both compressed and
uncompressed may as well remain on disk if there's space and it's
being actively accessed.

> implementation wise I see headaches in doing this, but conceptually this 
> is just an optimization that could take place in the future if we fine 
> that it's needed.

untarring a big source tree takes ages.  I wouldn't like to do it
after every reboot, if there was a .tar.bz2 tree I looked at often.
That's why I have things like glibc untarred in my home directory.

With good cacheing, I could cd into the .tar.bz2 files and
_effectively_ have the performance of untarred source trees for the
ones I look at often on my disk -- automatically cleaned if the space
if needed for something else, too.  It would be quite nice.

-- Jamie
