From: Hans Reiser <reiser@namesys.com>
Subject: Re: Re: [STUPID TESTCASE] ext3 htree vs. reiserfs
 on 2.5.40-mm1
Date: Sat, 05 Oct 2002 02:27:20 +0400
Message-ID: <3D9E15C8.2060005@namesys.com>
References: <200210042254.23978.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11609-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>, Chris Mason <mason@suse.com>, Paul P Komkoff Jr <i@stingr.net>, Manuel Krause <manuel.krause@mb.tu-ilmenau.de>

Dieter N=FCtzel wrote:

>Am Mittwoch, 2. Oktober 2002 10:48 schrieb Paul P Komkoff Jr:
> =20
>
>>Replying to Andreas Dilger:
>>   =20
>>
>>>Why do you think data=3Dwriteback is better than data=3Djournal?  If the
>>>files have no data then it should not make a difference.
>>>     =20
>>>
>>It is better than default data=3Dordered I think :)
>>
>>Thanks for detailed explanation - it saved much time for me and
>>accortind to yours directions I have recalculated my test. Now ext3 is
>>better :)
>>
>>e3
>>create          2m49.545s       0m4.162s        2m20.766s
>>delete          2m8.155s        0m3.614s        1m34.945s
>>
>>reiser
>>create          3m13.577s       0m4.338s        2m54.026s
>>delete          4m39.249s       0m3.968s        4m16.297s
>>
>>e3
>>create          2m50.766s       0m4.024s        2m21.197s
>>delete          2m8.755s        0m3.501s        1m35.737s
>>
>>reiser
>>create          3m13.015s       0m4.432s        2m53.412s
>>delete          4m41.011s       0m3.893s        4m16.845s
>>
>>
>>this is two typical runs. Now I creating ext3 with
>>mke2fs -j -O dir_index -J size=3D192 -T news /dev/sda4
>>
>>as you can see, this improves performance by 1/4
>>
>>Unfortunately, there still one issue in ext3. It called "inode limit".
>>Initially I wanted to run this test on 1000000 files but ... I hit
>>inode limit and don't want to increase it artificially yet.
>>
>>Reiserfs worked fine because it don't have such kind of limit ...
>>   =20
>>
>
>Orange and apples, again?
>
>Try with latest ReiserFS data-logging and see what we get?
>Chris do you have something for 2.5.40+ ready?
>
>2.5.40 is GREAT!
>
>Regards,
>	Dieter
> =20
>
So, I think that if you create enough files in your test to stress the=20
IO subsystem, then it will be a much more interesting test.=20
 Unfortunately, you may need to increase the inode allocation to test=20
this for ext3.  Once you start to get above a million files, you may=20
start to see reiser4 doing substantially better than ReiserFS because=20
reiser4 has better layout and better hashes based on things we learned.

I would be curious to see your benchmark done for 3 million files.  I=20
would be curious to see what happens if you umount in the middle of it.=20
 I would not be surprised if interesting VFS/dcache performance issues=20
arise as you increase the number of files.

Hans


