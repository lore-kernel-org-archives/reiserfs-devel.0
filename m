From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Wed, 12 Mar 2003 01:54:32 +0300
Message-ID: <3E6E6928.80203@namesys.com>
References: <1047400482.8215.312.camel@tiny.suse.com> <20030311194205.A4493@namesys.com>  <1047403968.8219.337.camel@tiny.suse.com> <3E6E584D.4080809@namesys.com> <1047421551.8219.448.camel@tiny.suse.com> <6241720265.20030311233919@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <6241720265.20030311233919@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Anders Widman wrote:

>Would  it not be possible to have a daemon running and collecting data
>on   how   files  are  being  accessed  and  written.  Then  either  a
>defragmenter or the fs itself can optimize the on-disk layout?
>

There is an excellent Usenix paper on this that Nikita found, Nikita can 
you find it again?

I would love to have that approach built into reiser4, I think it would 
kick the butt of any other approach.

>
>Also,  would  it  be  possible  to  implement  some  form  of  command
>reordering  in  the  fs? It might increase performance where there are
>multiple accesses to smaller files on the same volume...
>
Can you define where that is better than letting the disk driver do the 
reordering?  (I am not saying yes or no, it is a genuine question.)

>
>//Anders
>
>
>   
>
>
>
>--------
>PGP public key: https://tnonline.net/secure/pgp_key.txt
>
>
>
>  
>


-- 
Hans


