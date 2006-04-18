From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Undeletable files...
Date: Tue, 18 Apr 2006 00:58:29 -0400
Message-ID: <444471F5.90707@suse.com>
References: <44414617.8030001@sharp.fm> <200604152358.07338.zam@namesys.com> <444353D7.5000302@namesys.com> <4442B2D9.6090307@suse.com> <44445AED.6080905@namesys.com> <4443B38D.1010103@suse.com> <44450FCE.4060608@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28504-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44450FCE.4060608@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Alexander Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com, Graham Leggett <minfrin@sharp.fm>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Jeff Mahoney wrote:
> 
>> Hans Reiser wrote:
>>
>>> Jeffrey Mahoney wrote:
>>>> Hans Reiser wrote:
>>>>
>>>>
>>>>> Sounds like acls or acl bugs.
>>>>>   
>>>>>
>>>> Or not, since ACLs weren't enabled on the mount.
>>> What happens if acls are used on one mount and not on another?
>>
>> To clarify, ACLs are a per-super feature. For this example, there
>> weren't multiple mount points with different options, so per-super and
>> per-mount are one and the same.
>>
>> If you mean if ACLs are enabled on one file system and not on another,
> 
> no, I mean if mounted with acls enabled once and then  without

Then the ACLs will no longer be interpreted, or inherited, until ACLs
are enabled again. ACLs aren't read and the interpretive code is
completely skipped if -oacl is not specified. If a file is deleted, all
xattrs associated with the file, including ACLs, will be deleted.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFERHH1LPWxlyuTD7IRAmTaAJ0Qbl7i7N+svQCIeYf94LyOl20HVgCfffIf
1yYoAuGzWZl6Wh1og6IFhJA=
=MixN
-----END PGP SIGNATURE-----
