From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Forked reiserfsprogs
Date: Tue, 22 Apr 2008 19:24:36 -0400
Message-ID: <480E73B4.8080005@suse.com>
References: <480B97E3.7080008@gmail.com> <480C0721.7090005@suse.com> <480E5861.7070205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <480E5861.7070205@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Vladimir Saveliev <Vladimir.Saveliev@sun.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Ric Wheeler <ric@emc.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Edward Shishkin wrote:
> Jeff Mahoney wrote:
>> If we actually have a stable 3.6.20, I'd be happy to forward port my
>> patches. One thing needs to happen, though: We absolutely need to start
>> testing on big endian hardware. We ship reiserfs on both powerpc and
>> s390, and hit the endian bugs quickly on those systems.
>>
> 
> Perhaps, I'll buy a cheap Mac G3 for testing (it is also needed for
> reiser4),
> but s390 seems to be exotic here..

That'll be fine. You don't need to test on all platforms. A ppc64 would
probably be better, but a G3 will work.

> Ok, I'll put what I have: 3.6.19.1 and renamed 3.6.20.

Sounds good.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIDnOyLPWxlyuTD7IRAsnSAJ4nvWjZQirBhoaz/9kQ/blalomMPgCfTrEU
OIpqVfvIKZYx7kjZm2+lhds=
=8dSb
-----END PGP SIGNATURE-----
