From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Bug report
Date: Thu, 14 Apr 2005 13:15:28 +0400
Message-ID: <1113470127.3466.41.camel@tribesman.namesys.com>
References: <5a59ce530504110707e0a4791@mail.gmail.com>
	 <1113233427.4420.221.camel@tribesman.namesys.com>
	 <5a59ce53050412065715fc6929@mail.gmail.com>
	 <1113396590.5168.446.camel@tribesman.namesys.com>
	 <425DF571.3000004@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425DF571.3000004@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: studdugie <studdugie@gmail.com>, reiserfs-mailing-list <reiserfs-list@namesys.com>

Hello

On Thu, 2005-04-14 at 08:45, David Masover wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> 
> 
> Vladimir Saveliev wrote:
> [...]
> > reiser4 has bitmap blocks spread uniformly over whole device. Those
> > blocks are to to be read on mount.
> > 
> > There is mount option "-o dont_load_bitmap" which speedups mount but may
> > make performance worse.
> 
> Is that really "don't load" or "don't preload"?  In other words, does
> this just make the FS slow for awhile, then as fast as normal as these
> things get cached in RAM?  

yes

> Or does this make it so that the bitmap never
> gets created in RAM, and must always be read from disk?
> 
> An analogy might be Software Suspend.
> 
> A suspend can be really quick -- just swap out everything, then write
> the kernel, process, and general state info out to disk.  When this
> boots up, it's really quick to get back into the OS, but it's insanely
> slow to actually get a desktop, because of all the seeks as it
> frantically tries to load everything that's being told to reload a
> window -- and it's loading everything at once, which means a thrashing
> of seeks.
> 
> A suspend can also be much longer -- write out the caches, too,
> basically dump at least half of RAM out to disk, and probably the whole
> thing.  But when you resume this, it doesn't take much longer to get
> into the OS, and you get your desktop back quicker, because everything's
> already been cached with a minimum of seeks.
> 
> (Coolness:  This isn't just theoretical anymore.  I've actually gotten
> suspend2 and reiser4 working on one machine, and reiser4 + unionfs +
> gmailfs + kqemu + nvidia's gl drivers working on another.  I think it's
> definitely stable enough to go into a 2.6 tree, even marked as
> "experimental".)
> 
> If this is how reiser4 works, I think dont_load_bitmap should be the
> default, because if you're going to do a bunch of seeks anyway, why not
> do them as needed -- a millisecond here, a millisecond there -- instead
> of all at once while the user's waiting for the thing to boot?

Hans prefers waiting on boot.

> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.1 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
> 
> iQIVAwUBQl31cXgHNmZLgCUhAQK0nA//Uym9KEpYivb4OsJNXuYCQ3u9GP/K9GNa
> KriyufqAo+Pth5rwBD8cgYWQwgiqZY4P8C7RsXwzKRz8ZUjt1KJ83DEekkDNPVRC
> zhF1P7WWI/rlFLQEg6OWtU/tuCG36VuPZK77faxxbkrcNZoPY4k9hBL/aoKi8L9A
> DagItRqDerevjhfky4OjM83cIrug4hQApxVjnpopT5LY2y4Md+ygqwtgVYHWEg6l
> wwqBgtstpgrGnyId6BB9m/asI1evCuuD2NO3kzOpRuX8xgF/POnXDtVCMpUymCmb
> r6IcWLlv6Z6fAk/mJ+QqpQZIflDu1Wmr+bzJ4vGznN2lkeiZU3dAdyWWVC28tofi
> oJPrdfwydcYqfFr6jSGDXwqeQUrh5AYHGyPYgRH65fy4cBs3KxvY5A8135xtL0+t
> CGLXKQCn6zt/Hw8xbcAusrIbi+pxE6M5BY2LspJ1SjzF/xdYs+w+foaz2/Ktnkgo
> vQdQ6b0nB4RApuTx5ajJwUbuVzNDn2kTpqgSq8aZhzinIl4ILv+N1DQ+1Cnw6UON
> lMv2KmVSoLEtVQSm5n6EpE6fTfh364ECNuL75cPYnuaPOH/73zQ6cOyOCukIz0oM
> SiTfPPAxz+6MnAM9Qre32ksUFSZ0yp5o/FvW+pbNL0V1MLLur0uh3mj8+HXFVdtJ
> vTpk7eGklig=
> =T6Pu
> -----END PGP SIGNATURE-----
> 

