From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: Will I need to re-format my partition for using the compression plugin?
Date: Thu, 22 Sep 2005 18:13:23 -0400
Message-ID: <e692861c050922151366608976@mail.gmail.com>
References: <194f625505092006316ad200b5@mail.gmail.com>
	 <2f4958ff05092208244a0496fc@mail.gmail.com>
	 <4332DE9F.8010808@namesys.com>
	 <200509221951.38302.namesys.Sch@ttgen.net>
	 <43330E14.9050209@namesys.com> <4333100F.6080307@slaphack.com>
	 <200509222049.j8MKn1CH012169@turing-police.cc.vt.edu>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26250-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509222049.j8MKn1CH012169@turing-police.cc.vt.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Valdis.Kletnieks@vt.edu" <Valdis.Kletnieks@vt.edu>
Cc: David Masover <ninja@slaphack.com>, Edward Shishkin <edward@namesys.com>, Fred Schaettgen <namesys.Sch@ttgen.net>, reiserfs-list@namesys.com

On 9/22/05, Valdis.Kletnieks@vt.edu <Valdis.Kletnieks@vt.edu> wrote:
> 1) RSA is useless for this - you really need a symmetric block cipher of =
some
> sort.  Almost all block ciphers are best used with maximum-entropy input =
- if
> the attacker can lop out a large part of the keyspace, a brute force atta=
ck
> becomes a lot easier.  This is somewhat related to the concept of "Hammin=
g
> Distance". If the attacker tries a brute force attack, and the first 8 by=
tes of
> the output look like valid HTML, or English text, or anything else
> recognizable, he's almost certainly found found the correct key.  On the =
other
> hand, well-compressed data has very high entropy - as a result, it become=
s
> harder to tell if a correct key has been found.  If it's English text, bu=
t
> 3 of the first 8 bytes have the high bit set, it's probably not a correct=
 key.
> If it's compressed, 3 flipped bits in the first 8 bytes will probably sti=
ll
> represent a valid compressed stream - just of something else wildly diffe=
rent.

It would normally seem silly to use RSA for disk encryption... but
there might be applications, although you'd still never use RSA
directly on user controlled data.  For example, RSA could be used on a
multi user server to append mail to a mail file so that once written
the data is only accessible once the user logs on.  The reiser4 crypto
system will use the kernel keyring api, so it would be quite
reasonable to tie encryption to user accounts. 'write only' files and
'read only' files would be a simple logical extension, and would
require asymetric cryptography.

Although for most compression algorithms not all inputs are valid
outputs, so this may not work for you... It would be ideal (for disk
encryption) if it were not possible to tell if you have the right key
without decrypting an entire sector. This requires careful selection
in compression and chaining mode.  Alternatively, it may be possible
to develop a good large block cipher which while being much slower
than a single block of a small-block cipher, is faster for a disk
block.  For example, mercy is about 4x faster than AES on my system
but is still 16x slower for the smallest unit of decryption than AES.
Unfortunately mercy has security problems.

> 2) Even though most modern block ciphers are designed to be fast, it's st=
ill
> faster to apply a reasonably quick compression scheme to whomp 16K of dat=
a
> down to 5-6K and encrypt/decrypt 5-6k than it is to encrypt/decrypt 16K.

Depends on the compression mode and the cipher. A good AES
implementation is around the same speed as an aggressive gzip. In
general this is correct.
