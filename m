From: Francesco Biscani <frbiscani@jumpy.it>
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Fri, 13 Aug 2004 22:45:55 +0200
Message-ID: <200408132245.55213.frbiscani@jumpy.it>
References: <Pine.GSO.4.44L.0408131513520.11129-100000@unix2.cc.ksu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20280-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GSO.4.44L.0408131513520.11129-100000@unix2.cc.ksu.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Matt Stegman <matts@ksu.edu>

Hi,

On Friday 13 August 2004 22:26, Matt Stegman wrote:
> The ctime will be updated.  'cp -a' cannot preserve the ctime field.
> Whether or not your application uses the ctime is something you'll have to
> determine (backup software usually does, for example).

I was thinking of gentoo's package system, which uses mtimes to detect if a 
file belonging to a certain package has been modified or overwritten. This 
way when uninstalling the package, that particular file is not removed 
because his mtime differs from the one present in the packages database.

cp man page says that the -p switch, implied by -a, preserves "the original 
files' owner, group, permissions, and timestamps." So the question is: is 
mtime included in "timestamps"?

> cp also does not copy EAs or ACLs, or any attributes set by chattr (not
> applicable to reiser4).  Any other attributes or permissions unique to
> reiser4 would also not be copied.

This would not certainly be a problem.

Thanks very much,

  Francesco
