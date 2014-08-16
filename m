From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sat, 16 Aug 2014 15:35:42 +0200
Message-ID: <53EF5E2E.6000109@gmail.com>
References: <3405506.BC0S4TX54B@intelfx-laptop> <53EF11C8.20209@gmail.com> <53EF14EC.1070101@gmail.com> <2295734.UIR3OjHuyC@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=wLVNFJy8jH+NV/5mlpdSTxCn5pg16YR5XHQq/Mn2Fhg=;
        b=Sqsc8oakPwSOXzoHNuRLqouhBlMXJ/jcH8M81yFScknah0NnJlwfxDVaTH2edoyxmV
         r8NEoqLKllvgBaX7ma1L8Gt7giBq+eDkRn0ec9ktgIdpf0ovOX5sKT0jOEg72E4A14n3
         KrYqCflyjwtsnK2SoO8yfpYPYDWh0aoUk7OcdzdOxHPqQO69voNlz+MHbe9/WgL9xZ0Z
         bXBPiwiJwLP4OcwnpcS+KXc7207heKP6yraBuSUy43466zTvgguiZ0Pz3WzrTzcu0urH
         Xd0ZL4IX56BEdPpsyyus7tsvqTvc7nJj9ObsLItAd6LzUb5hhCyEjLvTp11Xd/+KtfBm
         dcDg==
In-Reply-To: <2295734.UIR3OjHuyC@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 08/16/2014 01:27 PM, Ivan Shapovalov wrote:
> On Saturday 16 August 2014 at 10:23:08, Edward Shishkin wrote:	
>> [...]
>>>> So I need to find a way to take rwsem in a read-biased mode... Any
>>>> advice is
>>>> accepted, including "give up with adding of yet another lock and go with
>>>> multiple transactions" :)
>>>
>>> IMHO this is too complicated.
>>>
>>> Why don't you want to grab, say, 20M per iteration?
>>> It should work without any problems, just maintain a
>>> counter of blocks allocated in the iteration..
> I see it mostly like a "good to have" thing.


Nop, we discuss the reasonable implementation of the "must have" -
space reservation by the fitrim process..


>   When the system is under load,
> FITRIM implemented in this "simple" way will be ineffective: it will miss
> some blocks that are temporarily allocated (journal, etc.)


It will be perfectly discarded by the realtime discard


>   even though it is
> theoretically possible to stop accepting new transactions, commit all existing
> ones and perform discard while the system is artificially made idle, then
> resume everything.


IMHO complicated and not need.
Anyway, missing 2 blocks per device is not critical.


>
> So I've been trying to check if this is feasible. Looks like it isn't.
>
>> add the counter to the struct reiser4_context and
>> set it to zero at the beginning of every iteration.
>> use get_current_context() to access the counter.
> Is it needed? The simple way is just a loop consisting of
> - grab space
> - allocate blocks forward from start position (initially 0) until end of
>    partition or limit reached
> - update start position to `last allocated block + 1`
> - put allocated space to the delete set
> - mark for force-committing
> - reiser4_txn_restart_current()
> - if we've reached end of partition earlier, break, otherwise loop
>


Ok, it will also work (with more iterations, though),
well, let's do so..

Thanks,
Edward.

