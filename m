From: Oleg Drokin <green@namesys.com>
Subject: Re: Filesystem errors
Date: Wed, 17 Jul 2002 09:42:52 +0400
Message-ID: <20020717094252.C4841@namesys.com>
References: <200207160146.01440.cabernet@internode.on.net> <3D326683.1000606@namesys.com> <200207160222.50147.cabernet@internode.on.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11030-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200207160222.50147.cabernet@internode.on.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Marr <cabernet@internode.on.net>
Cc: Reiserfs list <reiserfs-list@namesys.com>

Hello!

On Tue, Jul 16, 2002 at 02:22:50AM +0930, Brian Marr wrote:

> What reiserfsck paramaters should I try ? Do I have to do --rebuild-tree ?

You hard drive is failing, so yuo should backup all the data to other
drive first, then you might want to revive your disk, or get it replaced
(which is even beter).
You better not to run reiserfsck or any other programs (besides tar or
some other backup tool) on this disk, because you might loose even more data
this way.

Bye,
    Oleg
