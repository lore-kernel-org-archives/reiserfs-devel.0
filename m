From: Oleg Drokin <green@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Tue, 11 Mar 2003 19:42:05 +0300
Message-ID: <20030311194205.A4493@namesys.com>
References: <1047400482.8215.312.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13188-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1047400482.8215.312.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Mar 11, 2003 at 11:34:43AM -0500, Chris Mason wrote:

> changes blocknrs_and_prealloc_arrays_from_search_start into three
> passes.  pass1 goes from the hint to the end of the disk, pass2 goes
> from the border to the hint, and pass3 goes from the start of the disk
> to the border.

As you probably remember, we decided to drop border stiff all together
because of all the extra seeking it incurrs.

> Overall, I believe this will significantly improve fragmentation over
> time.  oid_groups should only be used if your FS has a small number of

I hope we won't have read-access speed degradation with these.

Bye,
    Oleg
