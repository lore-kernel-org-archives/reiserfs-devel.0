From: Matt Stegman <matts@ksu.edu>
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Fri, 13 Aug 2004 15:54:39 -0500 (CDT)
Message-ID: <Pine.GSO.4.44L.0408131551230.11129-100000@unix2.cc.ksu.edu>
References: <200408132245.55213.frbiscani@jumpy.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20281-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408132245.55213.frbiscani@jumpy.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francesco Biscani <frbiscani@jumpy.it>
Cc: reiserfs-list@namesys.com

On Fri, 13 Aug 2004, Francesco Biscani wrote:
> cp man page says that the -p switch, implied by -a, preserves "the original
> files' owner, group, permissions, and timestamps." So the question is: is
> mtime included in "timestamps"?

Yes, mtime and atime are reset on the destination file after the copy.

-- 
Matt Stegman


