From: Paul Wagland <paul@wagland.net>
Subject: Re: reiser4 and bonnie problems
Date: Tue, 20 Apr 2004 10:54:49 +0200
Message-ID: <61B07E02-92A8-11D8-8B4A-000A95CD704C@wagland.net>
References: <20040416203937.GY14134@nysv.org> <26F302F3-9042-11D8-8B4A-000A95CD704C@wagland.net> <2EB65FD6-924A-11D8-8B4A-000A95CD704C@wagland.net> <16516.54935.159587.423283@laputa.namesys.com>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha1; boundary="Apple-Mail-40-1064874800"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18075-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16516.54935.159587.423283@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@Namesys.COM, Markus TXrnqvist <mjt@nysv.org>

--Apple-Mail-40-1064874800
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; format=flowed


On Apr 20, 2004, at 9:51, Nikita Danilov wrote:

> Paul Wagland writes:
>> Bonnie: drastic I/O error (write(2)): No space left on device
>
> Err.. this is completely different from what we had previously: "No
> space left on device" is understandable where not reasonable. What is
> completely mysterious is "No such file or directory" error that you
> reported before.

Yes, last night I could not get that "No such file or directory" error 
to appear. I will try to reproduce that particular error again later 
tonight. However, this other problem happens at exactly the same time, 
and is an error in the reiser4.

Just to summarise everything that is written below, this is what bonnie 
is doing:
1. write 3.5 GB onto a 4GB partition. This works
2. delete 3.5 GB from a 4GB partition. This works.
3. I check using df that the disk space is free. That works.
4. write 3.5GB onto a 4GB partition. This fails.

At the time of failure, according to df there is stiff 3.5 GB free. So, 
I say that reiser4 has a problem.

>> Note, that bonnie tries to create 3.5 GB worth of files on a 4GB
>> filesystem... this should not be causing a problem. Also, the "Writing
>> intelligently" test tries to write out the same amount of information
>> as the "Writing with putc()" test. After each test all the files from
>> that test are deleted, so this really should not be causing a problem.
>> Further, while running the test, I was also running a df loop, as can
>> be seen below:
>>
>> tidbit:~# while true; do sleep 1; echo `df /mnt/sdr | tail -1` `du -s
>> /mnt/sdr`; done
>> /dev/sdr1 3984228 3496804 487424 88% /mnt/sdr 3499521 /mnt/sdr
>> /dev/sdr1 3984228 3523684 460544 89% /mnt/sdr 3523393 /mnt/sdr
>> /dev/sdr1 3984228 3547620 436608 90% /mnt/sdr 3547329 /mnt/sdr
>> /dev/sdr1 3984228 410136 3574092 11% /mnt/sdr 1 /mnt/sdr
>>    < more or less here is where the intelligent write starts >
>> /dev/sdr1 3984228 84768 3899460 3% /mnt/sdr 84417 /mnt/sdr
>> /dev/sdr1 3984228 164624 3819604 5% /mnt/sdr 164273 /mnt/sdr
>> /dev/sdr1 3984228 246664 3737564 7% /mnt/sdr 246309 /mnt/sdr
>> /dev/sdr1 3984228 321952 3662276 9% /mnt/sdr 321601 /mnt/sdr
>> /dev/sdr1 3984228 404832 3579396 11% /mnt/sdr 404481 /mnt/sdr
>> /dev/sdr1 3984228 477264 3506964 12% /mnt/sdr 476913 /mnt/sdr
>> /dev/sdr1 3984228 527404 3456824 14% /mnt/sdr 1 /mnt/sdr
>>    < there is quite a long pause here, around about 5 seconds >
>>    < and in the meantime, bonnie has failed with a "no space left on
>> device" >
>> /dev/sdr1 3984228 296 3983932 1% /mnt/sdr 1 /mnt/sdr
>>
>>
>> With the modifications that I made above, the following lines are spat
>> out into the /var/log/kern.log:
>>
>> Apr 19 23:20:44 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
>> Apr 19 23:20:57 tidbit last message repeated 3 times
>> Apr 19 23:21:02 tidbit kernel: code: -503 at fs/reiser4/seal.c:170
>> Apr 19 23:21:02 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
>> Apr 19 23:21:17 tidbit last message repeated 3 times
>> Apr 19 23:21:22 tidbit kernel: code: -503 at fs/reiser4/seal.c:170
>> Apr 19 23:21:22 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
>> Apr 19 23:21:37 tidbit last message repeated 4 times
>> Apr 19 23:21:42 tidbit kernel: code: -503 at fs/reiser4/seal.c:181
>> Apr 19 23:21:42 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
>> Apr 19 23:21:57 tidbit last message repeated 3 times
>> Apr 19 23:22:02 tidbit kernel: code: -503 at
>> fs/reiser4/plugin/file/file.c:791
>> Apr 19 23:22:02 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
>> Apr 19 23:22:32 tidbit last message repeated 7 times
>> Apr 19 23:22:51 tidbit last message repeated 4 times
>> Apr 19 23:22:56 tidbit kernel: code: -503 at
>> fs/reiser4/plugin/file/file.c:791
>> Apr 19 23:22:56 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
>> Apr 19 23:23:12 tidbit last message repeated 4 times
>> Apr 19 23:23:16 tidbit kernel: code: -503 at
>> fs/reiser4/plugin/file/file.c:791
>> Apr 19 23:23:16 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
>> Apr 19 23:23:30 tidbit last message repeated 5 times
>> Apr 19 23:23:30 tidbit kernel: code: -503 at
>> fs/reiser4/plugin/file/file.c:791
>> Apr 19 23:23:30 tidbit kernel: code: -503 at
>> fs/reiser4/plugin/file/file.c:791
>> Apr 19 23:23:30 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
>> Apr 19 23:23:32 tidbit kernel: code: -503 at
>> fs/reiser4/plugin/file/file.c:791
>> Apr 19 23:23:32 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
>> Apr 19 23:23:34 tidbit kernel: code: -503 at fs/reiser4/seal.c:170
>> Apr 19 23:23:34 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
>> Apr 19 23:23:36 tidbit kernel: code: -503 at fs/reiser4/seal.c:170
>> Apr 19 23:23:36 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
>> Apr 19 23:23:37 tidbit kernel: code: -28 at 
>> fs/reiser4/block_alloc.c:319
>
> That looks ok, -28 == -ENOSPC.

Sure, the error code is right. But it should not be saying that it has 
no disk space when it claims to df that there is still 3.5GB free!

Cheers,
Paul

--Apple-Mail-40-1064874800
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (Darwin)

iD8DBQFAhOVatch0EvEFvxURAtxpAJ96WoueVEzaVBVUBuvD5gKAp7o48ACgoY/R
PUpqZkcEBfj9SRrEeovbMgE=
=PBSX
-----END PGP SIGNATURE-----

--Apple-Mail-40-1064874800--

