From: Valdis.Kletnieks@vt.edu
Subject: Re: Will I need to re-format my partition for using the compression plugin?
Date: Fri, 23 Sep 2005 02:08:52 -0400
Message-ID: <200509230608.j8N68rOT020809@turing-police.cc.vt.edu>
References: <194f625505092006316ad200b5@mail.gmail.com> <2f4958ff05092208244a0496fc@mail.gmail.com> <4332DE9F.8010808@namesys.com> <200509221951.38302.namesys.Sch@ttgen.net> <43330E14.9050209@namesys.com> <4333100F.6080307@slaphack.com> <200509222049.j8MKn1CH012169@turing-police.cc.vt.edu>
            <e692861c050922151366608976@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1127455732_2947P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26251-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 22 Sep 2005 18:13:23 EDT."
             <e692861c050922151366608976@mail.gmail.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: David Masover <ninja@slaphack.com>, Edward Shishkin <edward@namesys.com>, Fred Schaettgen <namesys.Sch@ttgen.net>, reiserfs-list@namesys.com

--==_Exmh_1127455732_2947P
Content-Type: text/plain; charset=us-ascii

On Thu, 22 Sep 2005 18:13:23 EDT, Gregory Maxwell said:

> It would normally seem silly to use RSA for disk encryption... but
> there might be applications, although you'd still never use RSA
> directly on user controlled data.  For example, RSA could be used on a
> multi user server to append mail to a mail file so that once written
> the data is only accessible once the user logs on.  The reiser4 crypto
> system will use the kernel keyring api, so it would be quite
> reasonable to tie encryption to user accounts. 'write only' files and
> 'read only' files would be a simple logical extension, and would
> require asymetric cryptography.

In fact, RSA would *still* be a poor choice there - the CPU costs go up
exponentially with the size of the object encrypted.  And if you have a 64K
sized files, that means if you use RSA directly, you get to do mathematics with
524,288 bit numbers.  Yep, multiply a 524,288 bit number by a 1024 bit number
and then compute the remainder when divided by another 1024 bit number. Lather,
rinse, repeat. ;)

You know how sites that do a lot of SSL buy special hardware accelerators?
The only *real* benefit they give you is offloading the CPU cost of doing
RSA over a 128-bit or so session key.

OK. Got that?  Doing RSA over a 16 byte file "costs" as much as opening a
standard 128-bit encryption SSL connection (because it's basically the same
thing).  And a 17 byte file costs you a lot more than 8 times as much.  And a
32 byte file isn't 16 times worse, it's *hundreds* of times worse.

That's why *nobody* uses RSA for anything other than securing a good-sized
symmetric session key.  So for this use, you'd use RSA to secure the file's
actual symmetric key (and possibly things like the initialization vectors).

(Note to designers - those pesky IV's are a *lot* trickier to get right
than you might think.  For instance, there's a known watermarking attack
against the current cryptoloop implementation in the kernel that allows
an attacker to prove the existence of data on the disk even without the
key - so a DRM scheme could find watermarked data even *after* encryption).

> Although for most compression algorithms not all inputs are valid
> outputs, so this may not work for you... It would be ideal (for disk
> encryption) if it were not possible to tell if you have the right key
> without decrypting an entire sector. This requires careful selection
> in compression and chaining mode.

In fact, Hamming distance considerations imply that usually you don't
need to decrypt more than 1 or 2 (*maybe* 3) blocks the size of the
symmetric cypher's blocksize.  For something like AES-256, you can probably
be sure in 32 bytes (1 block), very sure in 64 bytes, and totally sure in 128
bytes (unless the attacker has the misfortune to be trying to decrypt a file
that has actual structure on the same order as /dev/random output).

>                                   Alternatively, it may be possible
> to develop a good large block cipher which while being much slower
> than a single block of a small-block cipher, is faster for a disk
> block.  For example, mercy is about 4x faster than AES on my system
> but is still 16x slower for the smallest unit of decryption than AES.
> Unfortunately mercy has security problems.

Tough design challenge there.

The problem is that if you have a cipher that can handle 512-*byte* input
blocks, it's going to probably stomp on a *lot* of L1 and L2 cache lines.
And you can't even rely on the usual pre-expansion tricks because that adds
even *more* to cache pressure.

Another desirable property of symmetric ciphers is that they tend to change
about half the output bits for a single-bit input change, and in an unpredictable
manner.  This ends up meaning that you'll probably need O(log2 N) rounds, and
more likely closer to O(N) rounds, to mix the pool.  Gonna be a *lot* of rounds
for a 512-byte block. ;)

> > 2) Even though most modern block ciphers are designed to be fast, it's still
> > faster to apply a reasonably quick compression scheme to whomp 16K of data
> > down to 5-6K and encrypt/decrypt 5-6k than it is to encrypt/decrypt 16K.
> 
> Depends on the compression mode and the cipher. A good AES
> implementation is around the same speed as an aggressive gzip. In
> general this is correct.

That's why you don't use an *aggressive* gzip, but use 'gzip -3' instead. :)


--==_Exmh_1127455732_2947P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFDM5v0cC3lWbTT17ARAj66AKCgKEHh4dEl62w8xGZlkV34f045UwCgtSbE
ma9fSHhv/kOHylIGWQWAC9Q=
=qF0s
-----END PGP SIGNATURE-----

--==_Exmh_1127455732_2947P--
