From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 2/2] reiserfs: Add mount counting
Date: Wed, 05 Dec 2007 10:52:43 -0500
Message-ID: <4756C94B.1030101@suse.com>
References: <474B4BCF.1000905@suse.com> <47545D0D.6080608@suse.com> <5c7c368b0712031236i33abc7bdtd7a14354c67169b3@mail.gmail.com> <475469B8.4050004@suse.com> <5c7c368b0712031251w75febd3bve5aee70c4935a7c9@mail.gmail.com> <475475E5.1010400@suse.com> <5c7c368b0712031456p120634behc13f2d546df8659b@mail.gmail.com> <47548A90.3060805@suse.com> <475697F3.8050209@emc.com> <4756A124.1020905@sun.com> <4756C48C.60400@suse.com> <4756C645.3060005@emc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4756C645.3060005@emc.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ric@emc.com
Cc: Vladimir Saveliev <vs@clusterfs.com>, Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ric Wheeler wrote:
> 
> 
> Jeff Mahoney wrote:
> ....
> <snip>
> ....
>>>>
>>> No, I do not think so. I forked that work from 3.6.19 and did not put it
>>> anywhere but ftp.namesys.com/pub/tmp
>>
>> That's strange. Someone else must've moved it to /pub/reiserfsprogs/
>> then. That's certainly where I got a copy of it. A google for
>> reiserfsprogs 3.6.20, shows several pointers to
>> ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.20.tar.gz too.
>>
>> - -Jeff
>> - --
> 
> It would be great to get that work out for broader review & testing if
> that is not what you picked up...

The testing part we'll get automatically. It's checked into our internal
testing distribution at SUSE, which eventually gets mirrored out as
OpenSUSE Factory.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHVslLLPWxlyuTD7IRAkvCAJ9WeQegQCl9JhJWr47eu6U7yYCt0wCeOKk6
S5rzZUEP4oRXAMkYdUlD8j4=
=3jac
-----END PGP SIGNATURE-----
