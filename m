From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] various allocator optimizations
Date: 14 Mar 2003 15:40:46 -0500
Message-ID: <1047674445.8219.1194.camel@tiny.suse.com>
References: <1047400482.8215.312.camel@tiny.suse.com>
	 <20030311194205.A4493@namesys.com>
	 <1047499021.8219.604.camel@tiny.suse.com>  <3E6F9DE3.2070902@namesys.com>
	 <1047571151.8219.956.camel@tiny.suse.com>  <3E711F34.4060309@namesys.com>
	 <1047605662.8215.1068.camel@tiny.suse.com>  <3E71AE72.3090107@namesys.com>
	 <1047649898.8218.1095.camel@tiny.suse.com>  <3E72268E.8060801@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13258-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E72268E.8060801@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

On Fri, 2003-03-14 at 13:59, Hans Reiser wrote:

> >Grin, who are you and what have you done with the real hans ;-) 
> >
> You don't need it for every file, you need it for every directory.
> 

How does a given file know which directory to update, you'd need a
pointer in each file to the corresponding key of the directory where the
accounting is actually done.

> > It's
> >two fields, one for the counter and one to point up the chain to the
> >real owner.  It's yet another field to maintain as objects are deleted
> >and created, 
> >
> or written to or truncated, yes, the cost of lots of updates to this are 
> worrying.    It might be better done in the repacker than dynamically, 
> in fact I just convinced myself of that, how about you.....?
> 
> >a minor format change since old filesystem stat data won't
> >have the field, and requires support from fsck.
> >
> Nobody will mind if we change reiser4 format now....
> 

I'm also concerned with improving the block allocator for reiserfs v3,
there's no reason to keep the existing one if minor changes can make it
substantially better.

-chris


