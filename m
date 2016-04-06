From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [BUG] Big fiability issue?
Date: Wed, 6 Apr 2016 17:03:10 +0200
Message-ID: <5705252E.8050300@gmail.com>
References: <5703DD31.50604@gmail.com> <1459902224.31752.1.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=G0j3xeUwQKIhzJ5xkGBKBF61UH89qRWDir0xyindWAk=;
        b=uxSpMVbWmOcyoM4JBTPBDhr52yDNHty9f2TYtK/46xgZDFJvxIkM3NwYbQot6S0A/e
         BNjbHZkdCnQPprTEcCA2j7sDOjrGn56Xna54bK4uCWoE/MNY90tA6ZurTfDS2933asvK
         uP3Qy6brWbt3vNdx7hXFzsMnBokWdtMTFdiTjFxMPb+3kYEBGeXHHZvAFddxxur/sM0V
         zEmGBt5h9V3srZJkKmMvKCBPaETcdYN2Vz5cmVTKhXARu+UQ5iEHVwhVuNU4Hj4T8d9C
         Go1PzG5XT/OCYFFkvH+d/ZVyvZ8wY9SLsc4UgyjDzj1CTmYE6F3ZYu+/BzDzPtMd7T60
         ex9Q==
In-Reply-To: <1459902224.31752.1.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, =?UTF-8?Q?Mathieu_B=c3=a9langer?= <b747xx@gmail.com>
Cc: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hello Ivan,

Write barriers mean a proper ordering of writes. This is needed to
guarantee consistency. For example, commit record should be written
*after* writes of all journal blocks, etc. In reiser4 write barriers
are always "on" by design.

There were 2 ways to provide such ordering: hardware and software
ones. The hardware way assumes additional supports from the hard
drive and the block layer. The Linux block layer had had such support
~6 years ago, however it was dropped then:
https://lwn.net/Articles/400541/
See also Linux/Documentation/block/barrier.txt in old kernels

Respectively, we should discontinue the "hardware barriers" support
in reiser4 and unconditionally switch to the software implementation
that we have for devices without hardware barriers support. I forgot
to make such switch in due time.

Thanks,
Edward.

On 04/06/2016 02:23 AM, Ivan Shapovalov wrote:
> On 2016-04-05 at 17:43 +0200, Edward Shishkin wrote:
>> Hello Mathieu,
>>
>> I found that by default reiser4 still relies on a block layer
>> feature,
>> which is not longer supported. This is so-called "barriers". And yes,
>> on the power outage bad things are bound to happen. However, it
>> is up to bad luck.
> Hm. Write barriers are not supported? `man mount | grep barrier` yields
> many results... or are they different barriers?
>
> --
> Ivan Shapovalov / intelfx /
>
>> The attached patch removes the rest of block barriers support in
>> reiser4. So, now we honestly wait for IO completion of wandered
>> blocks (overwrite set) before submitting a journal header (journal
>> footer).
>>
>> Not sure if it will address your problem though. Also, data
>> corruption
>> after rw-mounting of checked (rebuild-fs) partition is still a
>> concern.
>>
>> Thanks,
>> Edward.

