From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: implement basic reiserfs 3.7
Date: Mon, 29 Nov 2010 15:10:39 -0500
Message-ID: <4CF408BF.8080309@suse.com>
References: <4CE7F21B.4050605@suse.com> <4CF07C63.40408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4CF07C63.40408@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11/26/2010 10:34 PM, Edward Shishkin wrote:
> Jeff Mahoney wrote:
>>  This patch contains the basic implementation for reiserfs 3.7.

>> +int has_nonstandard_journal(struct reiserfs_super_block *rs)
>> +{
>> +	return is_reiserfs_jr(rs) ||
>> +	       (is_reiserfs_3_7(rs) && rs->s_v1.s_journal.jp_journal_dev);
>>  }
>>  
>>   
> 
> Actually the function above is brain damaged.
> Journal is non-standard _iff_ it is "relocated" or has length (excluding
> journal
> header) different from 8192. So it can happen that a partition is "jr" (with
> REISER2FS_JR_SUPER_MAGIC_STRING), but has _standard_ journal.

Ok. I was under the impression that reiserfs_jr implied a nonstandard
journal. I guess that's mistaken. It seems to me that the only thing
wrong with the patch is the dev check and the name of the function.
Perhaps it should be may_have_nonstandard_journal(). The idea wasn't to
identify nonstandard journals but to extend the existing jr checks to
include 3.7 checks as well.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkz0CL8ACgkQLPWxlyuTD7KpOgCdGkzb5GvbXXPEck1qx5AN1Qcg
xHgAn3KmHQGC/cxxoKrswuovhGR8Qq9f
=ZQMq
-----END PGP SIGNATURE-----
