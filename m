From: Oleg Drokin <green@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Wed, 12 Mar 2003 10:14:32 +0300
Message-ID: <20030312101432.B8452@namesys.com>
References: <1047400482.8215.312.camel@tiny.suse.com> <20030311194205.A4493@namesys.com> <1047403968.8219.337.camel@tiny.suse.com> <3E6E584D.4080809@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13208-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E6E584D.4080809@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

Hello!

On Wed, Mar 12, 2003 at 12:42:37AM +0300, Hans Reiser wrote:

> Chris, don't you think the right answer would be to take zam's resizer 
> and make a defragmenter out of it?

Well, this should be in kernel, but current resizer (the one that can actually move
the blocks) requires unmounted fs.
Actually we can just create trivial interface for "take this block and move it there
atomically (through journal)", just like ext3 guys did. But that did not bought them
online defragmenter yet, I think ;) 

Bye,
    Oleg
