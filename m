From: Basil Chupin <blchupin@tpg.com.au>
Subject: Re: What does this mean?
Date: Mon, 15 Jul 2002 23:27:35 +1000
Message-ID: <3D32CDC7.7020903@tpg.com.au>
References: <3D2993E5.6030707@tpg.com.au> <20020708190923.A928@namesys.com> <3D29BA3F.7010201@tpg.com.au> <200207081228.56302.kuba@mareimbrium.org> <3D2E6DAB.9050400@tpg.com.au> <200207121326.g6CDQu3u003587@turing-police.cc.vt.edu>            <3D2FFA1B.8050302@tpg.com.au> <200207141636.g6EGaTCr017595@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11009-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Valdis.Kletnieks@vt.edu wrote:

>On Sat, 13 Jul 2002 19:59:55 +1000, Basil Chupin <blchupin@tpg.com.au>  said:
>
>  
>
>>We compared the outputs from the 'ps aux' command and what I found is 
>>that I am not running the kjournald process on any of my (3) 'systems' 
>> while he is (on his 2 'systems') even though our setups are almost 
>>identical (with regards to running SuSE v8 ). I thought kjournald was 
>>part and parcel of reiserfs but then why isn't it running on my 
>>'systems'? Just another mystery.
>>    
>>
>
>ext2 filesystems don't have a kernel thread.
>ext3 have one kjournald thread per file system.
>resierfs have one kreiserfsd thread per file system.
>
>You don't have any because you're all reiserfs.
>
I learn someting new every day. Thanks for this information. And, Yes I 
do only have reiserfs installed.

>  His two systems obviously
>have at least 1 ext3 file system (/boot or / perhaps?)
>  
>
Ah, now this is something I believe he does not have. Like me he 
installs everything under the one file system. Howeve, I will check with 
him just in case he somehow misconfigured his system by accident (or 
design).

Cheers.




