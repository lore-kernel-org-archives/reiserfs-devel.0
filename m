From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Thu, 06 Jul 2006 14:19:28 -0400
Message-ID: <44AD5430.1090701@suse.com>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>	 <1151608355.6335.79.camel@tribesman.namesys.com>	 <1151612146.11510.4.camel@ipso.snappymail.ca>	 <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>	 <1152059846.30139.11.camel@ipso.snappymail.ca>	 <44AB25EE.8030702@namesys.com>	 <20060706125856.fdac1d16.pegasus@nerv.eu.org> <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com> <44AD5287.4090208@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28922-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44AD5287.4090208@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Mike Benoit <ipso@snappymail.ca>, =?UTF-8?B?SnVyZSBQZcSNYXI=?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> There should be no possible fragmentation that would increase CPU usage
> like that.  With the current algorithms, in which you check one field in
> the bitmap to see if it has any free blocks, it should not be possible
> for scanning bitmaps to take so much time......
> 
> There must be a bug in there.

I'm sure there is, but it's a bug that others don't seem to be seeing,
including myself, and Mike reported he's not experiencing the problem
anymore. Given my current workload, unless I can readily reproduce it
locally, this takes a low priority for me.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFErVQwLPWxlyuTD7IRArvSAJ9pXBTGPzJjHYXQFHBQhYz5CTqQXwCeM4G4
zUqhLF9xWk1XInebVRevTVo=
=qzQB
-----END PGP SIGNATURE-----
