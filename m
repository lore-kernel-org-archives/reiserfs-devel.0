From: Chris Mason <mason@suse.com>
Subject: Re: What is [PATCH] 02-directio-fix.diff (namesys.com) for?
Date: 17 Feb 2003 16:43:20 -0500
Message-ID: <1045518199.1713.467.camel@tiny.suse.com>
References: <3E514C55.20808@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12795-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E514C55.20808@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Mon, 2003-02-17 at 15:55, Manuel Krause wrote:
> Hi!
> 
> Is this patch from 030213 it needed by anyone using ReiserFS within 
> 2.4.20 and 2.4.21-preX ?
> 
> What is "DIRECT IO" with reiserfs from the topic line of the patch:
> "# reiserfs: Fix DIRECT IO interference with tail packing" ?

It fixes a bug where a recently unpacked tail might race to the disk
with bytes modified via DIRECT IO.  The common way to trigger the bug is
via a mixture of direct io and regular file access at the same time.

Most people won't see the bug, since it is uncommon to mix regular and
direct io that way.

-chris


