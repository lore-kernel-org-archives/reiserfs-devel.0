From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Sat, 14 Aug 2004 11:46:50 +0300
Message-ID: <20040814084650.GM1284@nysv.org>
References: <200408132206.28624.frbiscani@jumpy.it> <Pine.GSO.4.44L.0408131513520.11129-100000@unix2.cc.ksu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20283-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.44L.0408131513520.11129-100000@unix2.cc.ksu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Stegman <matts@ksu.edu>
Cc: Francesco Biscani <frbiscani@jumpy.it>, reiserfs-list@namesys.com

On Fri, Aug 13, 2004 at 03:26:26PM -0500, Matt Stegman wrote:
>
>cp also does not copy EAs or ACLs, or any attributes set by chattr (not
>applicable to reiser4).  Any other attributes or permissions unique to
>reiser4 would also not be copied.

Until cp gets patched to support these ;)

-- 
mjt

