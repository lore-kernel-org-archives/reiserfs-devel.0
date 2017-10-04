From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Real status of ReiserFS4?
Date: Wed, 4 Oct 2017 22:27:57 +0200
Message-ID: <4f7994bf-3210-2d98-8fee-f4ba1df873ad@gmail.com>
References: <F9C551623D2CBB4C9488801D14F864C60154C6BE9F@ex-mb1.corp.adtran.com>
 <2027a1de-0aac-97f2-40f0-401e585e38ae@gmail.com>
 <F9C551623D2CBB4C9488801D14F864C60154C6C4FE@ex-mb1.corp.adtran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=bu3EZ494GsVAs+WNrltBzEJuzGEKgXBn7X3Rj0xtdH0=;
        b=HBVVwTv8QeQSRCicoeSxmvD6HCG3iGW0bKMHbNQgmg8Z609BPjY9oAhM6Ro9Z26LVt
         Tfe+y0uIN95fwzT6husvHBRyxr6tpP8tNlltf5/CFhR59qEGl8KR96lYdZrSlYkdfEdj
         SsPM8TtDJFCR1wFTi7w5y6/XvB8JdDMQBV4BRdUue1u3mTqGOxcz+O9PqtWWdphDt8My
         IH+Wa+GlaDfJfEzk0eJsuu4iCqe1rhf5r/gV6TsMr+thFMI7/yDxNgTEj0dpU0KpayBE
         ldRfKp8Bz+lliJe0pUOij40CnUN1onDWDlzGOnYOmyLnE57m8IwvbMFLXVBlSvSiyJ0g
         qLhA==
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C60154C6C4FE@ex-mb1.corp.adtran.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>, "'reiserfs-devel@vger.kernel.org'" <reiserfs-devel@vger.kernel.org>

On 10/04/2017 05:46 PM, ANDY KENNEDY wrote:
>> Basically, it is stable (as of the latest stuff release). However,
>> I would recommend reiser4 only for personal needs, not for production
>> (corporate use). The latter requires some work to be done in active
> Yeah, that was what I was told in the late 90's when I put an early
> rev of ReiserFS on a production server with a whopping 75GB of storage.
>
> Eventually, after about the 5 power loss on the system, it corrupted
> that partition.  Reiserfs-progs was able to recover it, though.  So,
> is this one of those cases where if I put it on a production system it
> will work great as long as I don't improperly drop power on it?

In the late 90's ReiserFS (v3.2) hadn't been possessing even a journal.
Now Reiser4 has an advanced transaction manager allowing to choose a
transaction model (journaling, write-anywhere, etc), which is most
suitable for your storage media and workload.
So, definitely not those cases :)

> I really like the stability of ReiserFS over everything else I've used.
>
>> collaboration with administrators of production systems. Reiser4 has a
> I own all of these systems.  Most are built from scratch.

I am afraid that it can be not enough. Some production-critical issues
require substantial efforts (profiling, fixing, etc). Normally it is a
business for paid developers, while we all are volunteers whose main time
is occupied with other things.

>> number of open tickets/bugreports, but all of those problems are hard
>> reproducible. Every sophisticated file system has a list of such
>> issues, though.
> Yeah, hence the question above.
>
>> It is really hard to corrupt a reiser4 partition in a way that fsck
>> will refuse to fix it. Nevertheless, I wouldn't recommend to use too
>> large partitions. The smaller partition, the larger chances, that I'll
>> take a look at it, if any problems with fsck.
> I have a back-up copy (actually several back-up copies).  And, this is
> data that doesn't change that much, so I can recover fairly easily.
>
>> Also, keep in mind that
>> intelligent compression (default mode) is not optimal for large media-
>> files (seehttps://reiser4.wiki.kernel.org/index.php/Reiser4_Howto  for
>> details).
> With a 15TB drive, I'm not worried about compression.  That, IMO, would
> be a performance hit anyway.

Depending on types of data and workload, compression can dramatically
speed up, or slow down things. The best case is working with sources
(compilation, etc). The worst case is removing a large media-file which
contains zeros in its head. If you are not sure about data/workload,
then better turn compression off.

Thanks,
Edward.

