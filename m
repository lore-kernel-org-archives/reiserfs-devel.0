From: David Masover <ninja@slaphack.com>
Subject: Re: file system curruption
Date: Thu, 21 Apr 2005 08:44:34 -0500
Message-ID: <4267AE42.2040300@slaphack.com>
References: <425FB56E.7060801@cpc.wmin.ac.uk> <1113817744.3975.58.camel@tribesman.namesys.com> <42676B73.4040109@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23905-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42676B73.4040109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, Szabolcs Illes <illes@cpc.wmin.ac.uk>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Vladimir Saveliev wrote:
> 
>> Hello
>>
>> On Fri, 2005-04-15 at 16:37, Szabolcs Illes wrote:
>>  
>>
>>> Hi,
>>>
>>> I have found these entries in my system log: (maybe it's a reiserfs4
>>> bug)
>>>
>>> Mar 14 20:06:15 sunset reiser4[umount(8489)]: reiser4_handle_error
>>> (fs/reiser4/vfs_ops.c:1432)[foobar-42]:
>>> Mar 14 20:06:15 sunset reiser4 panicked cowardly: Filesystem error
>>> occured
>>> Mar 14 20:06:15 sunset   
>>
>>
>> This indicates that reiser4 were not able to write block to a disk. It
>> is very likely that disk has problems.
>>
>> As you have fsck.reiser4-ed it succesfully - store data on better hard
>> drive and start thinking about not using this device for reiser4,
>> because such erorrs may come up again.
>>  
>>
> Please send me a proposal for how you can change our error messages so
> that everything you advised in this email would already have been
> advised by the error messages.

Easy.  Point them to a web page.  Especially if this kind of error is
usually caused by hardware.

On said web page, you want to point them to the "badblocks" utility for
finding if it's the disk's fault, and the "dm-bbr" patches, for if they
want to run Reiser4 on top of such a bad disk.

Or, if you want something short:  "Disk is dying?  Check hardware..."

Is this usually caused by hardware?  Because I also usually find other
entries in the system log related to hardware -- things about dma
timeouts and uncorrectable errors and the like.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQmeuQngHNmZLgCUhAQIS7g/9GYiPSklf+RpV4EJRK8JvpBdBaKYPJ1bO
lJfbvb0pVppikwwlY6a5NVmqACaeVXDP42+WCUPeL+9PX7EL5tgRGNO5RWW4g67Y
beiZbKtk5sbNsA7Acyxan4x+hkADB57M4ODL+HKx9wGg9d3DH53pFjR+G8lDBC24
4mxg8T6NCECpyV4IlDSNzVL0VdFkvaf/AiyXf3YGB9B43j4XxbjZVwJNTNqBp8w+
qxINNc8qpBN1kcrq2ZQc0/1yX3M9nBbOHafNRrHD2K8mmRx6CwOgGaqFOBWQJ+H0
JGqcgwq9kf/vXUGx8AN8g8NafGoE9H8aZ2SWKAfcklrcJeAoHS+pjlQ7ITF24O8g
4Ie9tBDzg2EyaYc814ftwjM9sov0rqNf/nZCd5HHPP3FmMhol/u2ZZw7tx7bXkV2
McN1OuI7+IrkTu4wFEuCI/lHSpeBCpMrCPmotiiubYQ69dpm5C/jbbgY/RgnFo/9
MNwsrcoZMpoWS9Q3cefFDrBN+IkwxjrI33z9HJFUY09rGGSMDXSkBJOGqYfplx9k
StpfxtsNb8v8UAf6mg8DYUExpsmjFbQdrELCAyP1KLL6GRJy7dmgGoUJTfC9Ridz
8cYQff81Q6BgTHoL2SvSG81oVwzVWIK78pG0TT+7UgFAYqKoshoIIx+I3aDxLdtC
E3GGguGC8FM=
=mnE7
-----END PGP SIGNATURE-----
