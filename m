From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation
 using linked lists.
Date: Sat, 19 Jul 2014 23:20:46 +0200
Message-ID: <53CAE12E.7090504@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <2333335.ugWK4TrHUo@intelfx-laptop> <53C2D82B.7030201@gmail.com> <2160912.yche19jEn0@intelfx-laptop> <53C338DB.7070603@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=IjPbrvtECS29dysSeFQZsed8xT5hEogLSCatrNCQFB0=;
        b=HqkhSU4MI2gmlwRwxSftplujYjhCq3R8EA/U70ZSX6CnfWrCF7LxUCDQC81dI9xsvo
         xG+SxPrqWmV1Lvi+qOS7uVaZsAsnAQcGER/3h9g9zP0l4dZpDL2ZoLamtdyRmx9vwW8g
         +lM+zE9ov7ysJ5zXM4erMbIGu9zMUxnaKXymT+n4UUwYbU2ZYrb/aczIxDmn+NFEPKkn
         ccX71fErG3DrMS2Qi41mzcfFFAfK4tX5N8JLYwgYiYOf6ETRgGLlJh05DKzFP0RYepyU
         kvGdljfuy0vDSA3YIGYN81/qKao9JLZ8nzob2NZqQPiU73+1vGv0KI+dy+LY6a7eObDd
         S6Hg==
In-Reply-To: <53C338DB.7070603@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 07/14/2014 03:56 AM, Edward Shishkin wrote:
>
> On 07/13/2014 09:18 PM, Ivan Shapovalov wrote:
>>
[...]
>>
>> Nothing seems to call at least check_free_blocks(begin, end)...
>
>
> Oh, bad... I thought all this time that extents of the delete sets are 
> still dirty
> in the working bitmap at the moment of discard.
> Hmm, I definitely don't want to check the whole extents for discard...


False alarm, actually..

Nothing is wrong if someone makes them dirty before issuing our discard
requests: his changes will be committed in the next sessions of possessing
the commit_mutex _after_ our discard. Everything is isolated.. For the same
reason we don't care if someone allocate blocks in head and tail paddings
before issuing our padded discard extents. We only need to make sure that
they were clean at _our_ commit session.

Anyway, let's use delayed deallocation. I like it better than 
aux_delete_set.
After all, we can roll everything back at every moment, if any problems..

Edward.
