From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: quicker mount
Date: Thu, 27 Apr 2006 11:41:48 -0400
Message-ID: <4450E63C.5080306@suse.com>
References: <20060427143635.GA5949@gelma.net> <4450D85E.50109@suse.com> <4450DBDB.5060209@dermichi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28534-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4450DBDB.5060209@dermichi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Weissenbacher <webmaster@dermichi.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael Weissenbacher wrote:
> Hi,
>> It takes so long to mount since ReiserFS reads all the bitmaps before
>> mounting. The larger the file system, the longer it takes.
> I wonder why it has to read all of them. Are they stored in RAM after
> reading? Otherwise I cannot see why it should be done at all.

Yes, they're kept in RAM. You can see the debate on this in the list
archives, but I asked the same questions.

There is no reason for the bitmaps to be retained in memory, as they're
more rarely used than other metadata which simply relys on the kernel to
cache intelligently.

The patches are written, they just need some debugging. Unfortunately,
they're kind of on the back burner right now due to other work constraints.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFEUOY8LPWxlyuTD7IRAguzAKCiudFGY1tFXOiSJ1743lrrb5kBJgCfcVG/
a3YBOD1EVcrEGsDFgkWRkKs=
=9lHG
-----END PGP SIGNATURE-----
