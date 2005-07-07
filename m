From: Jan Harkes <jaharkes@cs.cmu.edu>
Subject: Re: reiser4 plugins
Date: Wed, 6 Jul 2005 23:13:10 -0400
Message-ID: <20050707031310.GA12997@delft.aura.cs.cmu.edu>
References: <hubert@uhoreg.ca> <200507062033.j66KXNqM008212@laptop11.inf.utfsm.cl> <87ackzei41.fsf@evinrude.uhoreg.ca> <42CC9469.9000001@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25022-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42CC9469.9000001@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Hubert Chan <hubert@uhoreg.ca>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jonathan Briggs <jbriggs@esoft.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, ross.biro@gmail.com, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, vitaly@thebsh.namesys.com

On Wed, Jul 06, 2005 at 09:33:13PM -0500, David Masover wrote:
> And speaking of which, the only doomsday scenario (running out of RAM) 
> that I can think of with this scheme is if we have a ton of hardlinks to 
> the same file and we try to move one of them.  But this scales linearly 
> with the number of hardlinks, I think.  Maybe not quite, but certainly 
> not exponentially.
> 
> The only other doomsday scenario is if we have a ludicrously deep tree.

rename(a/b, c/b), if a and c are identical.

End result, either you deadlock trying to lock the same object twice, or
you end up removing b since the target of a rename is unlinked.

The VFS uses dentries, there is one per hardlinked object, and they have
a single parent only. So a/b and c/b are represented by the same inode,
but they have completely different dentry-aliases associated with them. 

Similar things for removal, we can safely remove a file, but not a
directory that still has children, if you have 'meta-files' hanging of a
file, you'd have to get rid of the metadata objects first.

If you want to use a file as a directory, it probably will need the same
restrictions as a directory if you expect the dcache and VFS locking to
work correctly. So that means, _no hardlinks to files_ (the file system
could internally implement copy-on-write type links, or use a content
addressable storage to deal with diskspace issues) and the file system
probably has to d_unhash/destroy metadata objects before it can unlink
the file object, etc.

> To make this work in real usage, not DOS testing, we really need both of 
> those, and even then I'm not sure it can work.  What's the maximum 
> number of hardlinks supported to a single file?

I believe nlink is a 16-bit value, so that would be either 32K or 64K
depending on signedness.

> What's the maximum tree depth?

Last time I checked, PATH_MAX is 4096, so that would be about 2048
single character directory names.

> Can these be limited to prevent actual DOS attempts?

Is that the 'nobody needs more than 64KB of memory' kind of DOS?

Jan

