From: Yury Umanets <umka@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Mon, 18 Aug 2003 20:20:36 +0400
Message-ID: <1061223635.6349.44.camel@haron.namesys.com>
References: <1047400482.8215.312.camel@tiny.suse.com>
	 <20030311194205.A4493@namesys.com>
	 <1047499021.8219.604.camel@tiny.suse.com> <3E6F9DE3.2070902@namesys.com>
	 <53331891906.20030316172514@tnonline.net>  <3F40FBB3.2000002@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15366-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F40FBB3.2000002@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

On Mon, 2003-08-18 at 20:15, Hans Reiser wrote:
> Anders Widman wrote:
> 
> >...
> >  
> >
> >>defragmenting tools are nice and all, but before we can write one we
> >>actually have to pick a disk layout for the tool to create ;-)
> >>    
> >>
> >
> >   Yes  and no :). A simple packer that defragments files, and perhaps
> >   move  files  that  are  in the same directory together. This can be
> >   done   without  knowing  usage  statistics  or  need  any  special
> >   algorithms?
> >
> >   //Anders
> >
> >
> >--------
> >PGP public key: https://tnonline.net/secure/pgp_key.txt

If you need this for reiser3, pay to Hans and we will implement it. Or
implement it by yourself using reiserfsprogs or progsreiserfs sources.

> >
> >
> >
> >  
> >
> for reiser4 we simply put nodes in tree order

