From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Thu, 06 Jul 2006 14:02:08 -0400
Message-ID: <44AD5020.6050803@suse.com>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>	 <1151608355.6335.79.camel@tribesman.namesys.com>	 <1151612146.11510.4.camel@ipso.snappymail.ca>	 <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>	 <1152059846.30139.11.camel@ipso.snappymail.ca>	 <44AB25EE.8030702@namesys.com>	 <20060706125856.fdac1d16.pegasus@nerv.eu.org> <1152200638.30139.45.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28920-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1152200638.30139.45.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Benoit <ipso@snappymail.ca>
Cc: =?UTF-8?B?SnVyZSBQZcSNYXI=?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mike Benoit wrote:
> My desktop machine (v2.6.16, same as my MythTV box) is running with 9%
> free space right now and it is not experiencing any slow down. I think
> the problem is caused by the usage pattern of MythTV and how it
> simultaneously streams one or more large files to the HD in relatively
> small chunks over a long period of time.

Ok, if you run into the problem again, can you dump the metadata before
freeing the space? The code itself looks sound, and I'm wondering if
you've managed to create pathological fragmentation that's mucking
things up. Being able to see the fs metadata would confirm or disprove
that theory, and help in fixing it.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFErVAgLPWxlyuTD7IRAnXvAJ9gpOT9PR0ndGhmtDOgKsEtcuZB6wCfRkYR
WMPwT7Tn8hW/Y/HFs8g6TrU=
=2lCS
-----END PGP SIGNATURE-----
