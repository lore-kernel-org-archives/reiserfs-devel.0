From: Oleg Drokin <green@namesys.com>
Subject: Re: Using filename-hash as part of key
Date: Mon, 23 Dec 2002 14:58:19 +0300
Message-ID: <20021223145819.A7670@namesys.com>
References: <20021223141641.B31759@namesys.com> <15878.63735.448875.70027@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12202-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <15878.63735.448875.70027@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com

Hello!

On Mon, Dec 23, 2002 at 02:52:23PM +0300, Nikita Danilov wrote:
>  >    We refer to this order as "read optimised" ;)
>  >    Of course writing files in read-optimised order is not always possible,
>  >    so the idea is to use hash of file name as part of the key.
> Can you clarify this? Hash of a file name is already used as a part of
> directory entry key (and has always been from the earliest versions of
> reiserfs, as far as I know).

No, I mean to use it as part of key used fir everything including
statdata/filebody

> v3. I generally think this is easy enough to try without a lot of
> discussion, thanks to decision to concentrate all key assignment
> decisions in one place (kassign.c). One point: probably we want to embed
> into key part of file name rather than hash.

That would require us to calculate the hash lots of times instead of doing
this only once, no?
We still do not suport changing of hash on the fly anyway.

>  >    That would allow us to allocate blocks for files in right order (only
>  >    true for reiesr4 where we have delayed allocation).
>  > 
>  >    Obvious disadvantages are: larger keys mean more fs overhead,
> If we restrict ourselves to only optimizing layout of stat-data (rather
> than file bodies), current key size would suffice, because now offset
> field of stat-data's key is unused.

No, I think optimising only statdata is not that useful as optimising
both statdata and file data.

>  >    this optimisation won't work if file gets renamed later, if this directory
>  >    is never read in sequentional order.
>  > 
>  >    But as Hans argues, usually these sequentional-read operations are ones most
>  >    noticed because they are usually performed by humans:
>  >    ls, tar, copy of a directory and this kind of stuff.
> Humans are so slow compared to the slowest hard drive that ls is the
> least important thing to optimize.

This is not true for large directories populated in random order.

Bye,
    Oleg
