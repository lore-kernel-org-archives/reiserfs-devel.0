From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Undeletable files...
Date: Mon, 17 Apr 2006 11:26:05 -0400
Message-ID: <4443B38D.1010103@suse.com>
References: <44414617.8030001@sharp.fm> <200604152358.07338.zam@namesys.com> <444353D7.5000302@namesys.com> <4442B2D9.6090307@suse.com> <44445AED.6080905@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28503-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44445AED.6080905@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Alexander Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com, Graham Leggett <minfrin@sharp.fm>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Jeffrey Mahoney wrote:
> 
>> Hans Reiser wrote:
>>  
>>
>>> Sounds like acls or acl bugs.
>>>    
>>>
>> Or not, since ACLs weren't enabled on the mount.
>
> What happens if acls are used on one mount and not on another?

To clarify, ACLs are a per-super feature. For this example, there
weren't multiple mount points with different options, so per-super and
per-mount are one and the same.

If you mean if ACLs are enabled on one file system and not on another,
nothing unusual will happen. The behavior for copying from one FS to
another is defined.

- From ACL fs to non-ACL fs, the ACLs will be lost.
- From non-ACL fs to ACL fs, unless "preserve permissions" is set, the
files will inherit from an optional default ACL.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFEQ7ONLPWxlyuTD7IRAqzPAJwLuf5BX2IlUuAnMJ0eAyqRO1lFCgCgkaPg
eugu4Q/rk56Qryz6JQ8bJEg=
=urun
-----END PGP SIGNATURE-----
