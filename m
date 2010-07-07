From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiserfs: problem with xattrs
Date: Wed, 07 Jul 2010 17:31:42 -0400
Message-ID: <4C34F23E.1060005@suse.com>
References: <20100707174734.GA1814@jolsa.brq.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20100707174734.GA1814@jolsa.brq.redhat.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jiri Olsa <jolsa@redhat.com>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/07/2010 01:47 PM, Jiri Olsa wrote:
> hi,
> 
> I hit a BUG in the reiserfs when halting my system,
> there was nothing in /var/log/messages after next startup
> but I took a photo of the screen, myabe it can help..
> 
> http://people.redhat.com/jolsa/reiserfs.zip
> 
> sry for the quality, it's a cell phone camera ;)
> 
> I'm using Fedora kernel 2.6.33.5-124.fc13.x86_64

This is a race between xattr shutdown and inode invalidation. I'm not
sure how yet, but it seems to have been fixed upstream. I can't
reproduce it with 2.6.34 or 2.6.35 but can easily with 2.6.32.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkw08j4ACgkQLPWxlyuTD7IKOgCgjCBhpu1VHeYPm8AhEEMZltAD
QjQAnRN6O0bR3yQAaInTBkQGJdflSAeX
=IFu5
-----END PGP SIGNATURE-----
