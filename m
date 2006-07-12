From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Wed, 12 Jul 2006 13:02:56 -0400
Message-ID: <44B52B40.3020704@suse.com>
References: <44B52674.8060802@suse.com> <200607121857.45988.dada1@cosmosbay.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28978-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607121857.45988.dada1@cosmosbay.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Dumazet <dada1@cosmosbay.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Eric Dumazet wrote:
> On Wednesday 12 July 2006 18:42, Jeff Mahoney wrote:
>>  On systems with block devices containing slashes (virtual dasd, cciss,
>>  etc), reiserfs will fail to initialize /proc/fs/reiserfs/<dev> due to
>>  it being interpreted as a subdirectory. The generic block device code
>>  changes the / to ! for use in the sysfs tree. This patch uses that
>>  convention.
>>
>>  Tested by making dm devices use dm/<number> rather than dm-<number>
> 
> Your patch handles at most one slash. But the description mentions 'slashes' 
> (ie several slashes)
> 
>> +	if (s)
>> +		*s = '!';
> 
> Maybe you need a loop

I'd prefer to correct the grammar rather than the patch. This patch
simply duplicates the logic in make_block_name().

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFEtStALPWxlyuTD7IRAgl0AJ9Q25r0SIZpIZrX/m6ld69OLwvoxQCfdRj/
XIT1LYuQThoypHAx7ud96h8=
=0ZdG
-----END PGP SIGNATURE-----
