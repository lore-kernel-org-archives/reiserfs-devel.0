From: David Masover <ninja@slaphack.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:02:46 -0500
Message-ID: <412E33D6.5020500@slaphack.com>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408261101110.2304@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20762-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408261101110.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Linus Torvalds wrote:
[...]
| 	tar cvf file.tar file file/

I don't like it.  Imagine this:
$ cat file/perm
040700 drwx------
$ cat file/perm/user/writable
1
$ cat file/perm/uid
0

Do that tar, and you lose the uid.  This is an example, and has plenty
of flaws.  The point is that often there may be files/directories within
files/directories.

In order to make this work, you either have to patch tar or split every
file/directory into a file/directory pair, recursively, using some sort
of mangling.  "file" becomes file.f and file.d.  Then tar works.

To be honest, I like my "serializer" better.  It just feels faster and
cleaner.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQS4z1XgHNmZLgCUhAQKXAQ//eJ9tPFFEf1kpFY7gYUhMSUAAs1wIvVrN
pOVyLPJwGTv4oIaq8/8Op+XmQt1BWfnFdgwSal5R7vuLlrj0/Lp714I4sTOb35+6
q4hB1Q6X1oKbS1QIVWM9zw8PaebTY1GZDYITqWEN8xFN2cx41m4HZZ9P2TXNGPWx
1TqeBAaR07N1LaDzDHWvXu2v8pP6Wjy8mmWbtHbjN7U8oLEAUVXmT/ZJ5MpVK6z6
FTTA6NnARpEDtWebTJit14IQYG88syl31+lNL/N87iTveYI3+6gAQniajkMda565
PnPbVCd/aLHpx4hNLYDiNZwGkhmCgA/V3/vHJGT1vbTWN56zFLF7XQqE0BMfR5k6
ozwzBZ368+suEs0pDplCJq7ru0BF3j49r2Ad7aILCJOENvN0uVzLNxmu+LfvARTm
gG7UNkJYcAjwmUaE1vXEACnwKhtyyxIpRbsb9ALqbDS9KXB7eAaI2FwLPXCU/L61
qHWHN47KllWdfT4fttwPd/Lag7UpKu9McBPnp9ZOTuYGY6QTgflBG1C7kallcJUw
7cZh831PRqmnj2hWcAlSvinD3ClxaF9swewMPfQJ9I10n7p6w9Q9EJEXUX6+gUhv
5MD6q2WxqNVM/i5Y/2s3GQ+3lJ2VvnWHkJgc7JkmP0H1N0vocYWhKaofMOQXAy57
/ocTFfcwzUc=
=YrfX
-----END PGP SIGNATURE-----
