From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiser4 limits
Date: Wed, 15 Sep 2004 10:51:58 +0400
Message-ID: <1095231116.5478.247.camel@tribesman.namesys.com>
References: <4147BA63.4010207@poelzi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4147BA63.4010207@poelzi.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "daniel.poelzleithner" <poelzi@poelzi.org>
Cc: Reiser FS Mailing List <reiserfs-list@namesys.com>

Hello

On Wed, 2004-09-15 at 07:43, daniel.poelzleithner wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> I just read a annoucement of solaris 10 which supports hyperbolical
> 2^128 byte large files ;)

In theory, reiser4 may have 2^64 byte long files.

> What are the reiser4 limits today, the faq is something outdated ?
> 

File size limit on i386 for reiser4 is 0x7ffffffffff.
For ext2  it is 0x1fffffff000.

Which FAQ are you refering to?

> regards
> ~ Daniel
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.5 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
> 
> iD4DBQFBR7pjy/mkIQp7AD0RAosrAJ95FpPvQbpBf3SQCoftet1C+MhN5ACVEQNg
> HaBbEVKa6pgmNr1BK1OjoA==
> =Fv4S
> -----END PGP SIGNATURE-----
> 

