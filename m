From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [SPAM] RE: [RFC] Pathname Semantics with //
Date: Fri, 10 Sep 2004 10:53:55 +0100
Message-ID: <20040910095355.GA20383@mail.shareable.org>
References: <20040909230333.GB8464@mail.shareable.org> <20040910013246.BF49B15ED9@mail03.powweb.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21672-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040910013246.BF49B15ED9@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Dabbs <david@dabbs.net>
Cc: 'Christian Mayrhuber' <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

David Dabbs wrote:
> After our magic mods, VFS will parse the // escape, see that it is
> NOT file:// and then what? When we were talking strictly about
> filesystem access this wasn't an issue.

Obviously it'll access whatever is mounted on //http:/, which is
probably a proxy to a daemon which handles HTTP.

Note: you can do this _today_ with no changes.  Just mount such a
daemon on /http: .

Similarly, you can make the suggestions of //file:/ and //:/ resolve
_today_ by simply putting the appropriate mounts on /file: and /: .

So is there any point in making // special?

> We certainly don't want the kernel in the business of being a protocol
> proxy, so any non-file:// pathnames could simply return EFAULT or ENOTDIR,
> or ELNKURL, which indicates that the target is a URL. Apps that want to do
> something /useful/ with the target resource (i.e. desktops) will have
> http/ftp/etc libraries. They are free to stat() the file, get the linked-to
> URL and use whatever protocol client lib they wish to access the URL. 

What is the point in putting anything at all in the common filesystem,
if the visible content of pseudo-files depends on the application
accessing them?

If you go down the road of requiring every application to use a
library, then there is simply no need for anything at all in the VFS.

Of course, that way we get the Gnome-VFS / KDE / emacs mess that vwe
have now, where paths that work in one program don't work in another,
making them a whole lot less useful.  There's also the unreliability
of having every filesystem operation go through an library prior to
calling the kernel -- what happens when a new fd-using syscall is
added to libc (like fgetxattr) and the intercepting library doesn't
know about it?  What about chdir and fchdir?  If you intercept those,
then you must intercept every syscall that uses a path for
consistency, even mount, fadvise so on.  Or alternatively, when
programs are required to call uservfs_open, uservfs_read etc., then
you have problems passing fds to libraries which don't call those.

In other words, doing it without kernel assistence is flaky.  Although
it does work, it's very hard to do it well and consistently, and it's
subject to silent breakage as libcs and the kernel evolve.

That's really why the kernel has to act as a proxy (even if it's only
using NFS, FiST, CODA or whatever mounts).  To get a unified
namespace, to ensure all accesses to a named object call the same code
(i.e. a daemon), and that path semantics are consistent even with
chdir and links inside a proxied directory.

> Shooting from the hip here. If we want to unify namespaces in a UNIXy way,
> what if we make the VFS expose all the non-file "protocol" namespaces
> through one mount point, device node or whatever. A filesystem, perhaps
> something built using FiST [http://www.filesystems.org/], would "handle" a
> protocol. Another, perhaps preferred, option is to steer in the direction of
> Plan9, where ftp can be mounted and handled by a user-space filesystem,
> ftpfs. 
> See http://plan9.bell-labs.com/magic/man2html/4/ftpfs

You can already do it, something like this:

    mkdir /http:; mount none /http: -t uservfs -o view=http
    mkdir /ftp:;  mount none /ftp:  -t uservfs -o view=ftp

I don't see any compelling reason to make "//" special for this.
However, if there is such a reason, then you could just mount protocol
handlers on "//http:" and so on, and make "//" a normal directory with
a special name.

-- Jamie
