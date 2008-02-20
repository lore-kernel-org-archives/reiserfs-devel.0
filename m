From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Lack of cached bitmap causing degraded performance and occasional
 hangs
Date: Wed, 20 Feb 2008 17:00:39 -0500
Message-ID: <47BCA307.40401@suse.com>
References: <47BC6869.1020504@fatooh.org> <47BC7BE7.9010400@suse.com> <47BC9D0F.4060302@fatooh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47BC9D0F.4060302@fatooh.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Corey Hickey <bugfood-ml@fatooh.org>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Corey Hickey wrote:
> Jeff Mahoney wrote:
> Does dropping the page cache make reiserfs forget how many free blocks
> are in the bitmap groups, or is that cached separately? I can always
> make the problem occur after dropping the page cache.

That's cached separately. What version of the kernel are you using?
There was an issue a while ago where file systems over 90% full would
run into huge performance problems because the allocator would always
try to find a free "window" of the size requested. This would cause it
to loop over the entire file system, and then step back and take
whatever it could find. We fixed that a while ago, though.

Caching all the bitmaps in memory for your larger file system would take
30 MB. The pattern of looping over them and back is not a good case for
an LRU list, since it loops over all of them and starts from the
beginning again. What did the memory footprint look like before you
dropped the caches?


> If I drop the page cache, and then start writing repeatedly, as in:
> -----------------------------------------------------
> echo 1 > /proc/sys/vm/drop_caches
> while true ; do
>     dd if=/dev/zero of=file bs=1M count=1024 2>&1 | \
>         grep copied | cut -d' ' -f6-
> done
> -----------------------------------------------------
> 
> ...then I get the following results:
> 47.7652 s, 22.5 MB/s

... and now we've cached a bit ...

> 34.7170 s, 30.9 MB/s
> 34.3364 s, 31.3 MB/s
> 35.0858 s, 30.6 MB/s
> 34.2207 s, 31.4 MB/s
> 34.4387 s, 31.2 MB/s
> 34.1648 s, 31.4 MB/s
> 34.6974 s, 30.9 MB/s
> 33.8431 s, 31.7 MB/s
> 35.1522 s, 30.5 MB/s

> If, instead of dropping the page cache, I trick the kernel into caching
> the bitmap with "debugreiserfs -m /dev/md0 &>/dev/null":
> 7.53645 s, 142 MB/s
> 8.17551 s, 131 MB/s
> 9.20222 s, 117 MB/s
> 7.12582 s, 151 MB/s
> 7.35693 s, 146 MB/s
> 6.98245 s, 154 MB/s
> 7.85886 s, 137 MB/s
> 7.96864 s, 135 MB/s
> 7.82978 s, 137 MB/s
> 7.84058 s, 137 MB/s

Yep, touching those blocks would delay those getting dropped.


> I don't know why the writing speeds are staying so consistently low in
> the first test. Yesterday I ran pretty much the same thing and saw the
> write speeds climb back up to around 140 MB/s over the course of five or
> six runs; today I repeated the test several times and saw the same
> results as I pasted above. I guess the kernel is preferring to cache the
> 1 GB file it just wrote. If I drop caches and write a 512 MB file
> repeatedly, the results are nicer:
> 
> 40.0924 s, 13.4 MB/s

.. and again, we've cached a bit ...

> 3.78939 s, 142 MB/s
> 3.17951 s, 169 MB/s
> 3.33849 s, 161 MB/s
> 3.77553 s, 142 MB/s
> 3.78852 s, 142 MB/s
> 2.92377 s, 184 MB/s
> 3.38227 s, 159 MB/s
> 3.71573 s, 144 MB/s

Your analysis is probably right: Writing the 1 GB file is forcing the
bitmaps out of the cache. Writing a 512MB file ends up not causing
memory pressure, so nothing is forced out. Your original report
mentioned that you could see measurable delays with 1 MB transferred or
even just one byte. Was that while your system was running at normal
load with a bit of memory pressure?

I think right now the most important question is which kernel version
you're running.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHvKMHLPWxlyuTD7IRAkLkAJ95UlfvkCMOBVsksDlV+jlK8vO7/ACfVr2h
U+DjYplVdcjXFQJzs37cmck=
=rYPO
-----END PGP SIGNATURE-----
