From: Oleg Drokin <green@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Wed, 12 Mar 2003 10:15:31 +0300
Message-ID: <20030312101531.C8452@namesys.com>
References: <1047400482.8215.312.camel@tiny.suse.com> <20030311194205.A4493@namesys.com> <1047403968.8219.337.camel@tiny.suse.com> <3E6E584D.4080809@namesys.com> <1047421551.8219.448.camel@tiny.suse.com> <6241720265.20030311233919@tnonline.net> <3E6E6928.80203@namesys.com> <9744137687.20030312001937@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13209-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <9744137687.20030312001937@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: Hans Reiser <reiser@namesys.com>, Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

Hello!

On Wed, Mar 12, 2003 at 12:19:37AM +0100, Anders Widman wrote:
    
> 2) The  disk  driver  has  no  knowledge  of  the above filesystem and
>    its  files.  In  case  of several concurrent writes of lots smaller
>    files  the  fs  could  allow for caching them and write them out in
>    sequence instead of parallel. Space might be more efficiently used,

Hm, I thought that's what we have page cache for ;)

Bye,
    Oleg
