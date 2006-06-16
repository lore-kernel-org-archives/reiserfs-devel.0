From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 03/05] reiserfs: rework reiserfs_warning
Date: Fri, 16 Jun 2006 15:33:46 -0400
Message-ID: <4493079A.2080004@suse.com>
References: <20060616041900.GA5395@locomotive.unixthugs.org> <44923BE3.7040303@namesys.com> <44924003.6050908@suse.com> <449301D3.3070303@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28804-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <449301D3.3070303@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Jeffrey Mahoney wrote:
> 
>> Hans Reiser wrote:
>>
>>> Please instead compile a list of warnings and errors that lack names of
>>> programmers responsible for that line of code, and ask Chris Mason which
>>> of them are his.
>>
>> I can interpolate which ones are Chris's since I generally see them
>> before they get submitted upstream. For the other ones, I'd rather
>> have people speak up and claim them.
> 
> How about creating a list of them that are not Chris's or yours, and
> then we send them to whichever person still around wrote most of that
> file to claim or deny?

Sure. I claimed most of mine when I made the patch. I can make the ones
in journal.c use clm-. Generating a list for the rest would be easiest
by grepping the third patch in the series for "reiserfs-" since there is
no unique identifier now to easily point out which message needs help.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFEkweaLPWxlyuTD7IRAvp2AJ9gqIo+yLw4/OKYc4tyOmfTaLSPPwCgiUPT
bQANpWPq89+tP4HIOGiJlo0=
=LlYD
-----END PGP SIGNATURE-----
