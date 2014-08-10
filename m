From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Mon, 11 Aug 2014 01:29:59 +0200
Message-ID: <53E80077.2060300@gmail.com>
References: <3405506.BC0S4TX54B@intelfx-laptop> <1526377.TUs3NQt8ap@intelfx-laptop> <53E7CC75.2010500@gmail.com> <1857998.1bln76ELaS@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=s38YdesXpa26cNVYlmGkfD1FEdSCLMqw1rzY1MrRbJc=;
        b=yfWCsNFu3pZs/S+0OUHF9OUlctyC+4U/NpSYs05dNZ9H4bymxLvThK8uLbPNrIW4RN
         qudcBhVedOTl/6uEoyXNW4yCDrz/56rIhad7O8RvM6WurlAMg/0pvlTpq8gpo4oipW2B
         MXhIK4r7C+XivTUV5IBK2TvSAcJYR2R3yapN065ngEN2skWOHCcWfssVpU0/nZL1uLWF
         WRO9JLQvtIsbnI7ClT9TJ9qVmP4a7MUoLB9oZ5kHlADupxVAIocBRxjPp3wd6EfuV8Fg
         ToXnkymMvMWPcupoJl/FCj5Saha8ezIwuovxgdcwP/WhQwEUzmS19iUetlnd4xkmGakz
         +W6g==
In-Reply-To: <1857998.1bln76ELaS@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 08/10/2014 10:37 PM, Ivan Shapovalov wrote:
> On Sunday 10 August 2014 at 21:48:05, Edward Shishkin wrote:	
>> On 08/10/2014 08:52 PM, Ivan Shapovalov wrote:
>>> On Friday 01 August 2014 at 01:19:05, Edward Shishkin wrote:	
>>>> [...]
>>>> Define maximal number of allocated blocks in one iteration
>>>> and reserve this amount of blocks at the beginning of each
>>>> iteration. Once the limit is exhausted, stop the scan and
>>>> force to commit the atom.
>>> This sounds pretty hackish... Isn't there a way to grab all possible space
>>> at the same time?
>>> By all possible space I mean (sbinfo->block_count - sbinfo->blocks_used),
>>> so that `fstrim <mountpoint>` will be efficient even if system is under load
>>> and atoms are being created continuously.
>>
>> I am afraid that other processes will return ENOSPC, whereas there is
>> a lot of free disk space.
>> Assume fstrim grabbed all possible space. A process X , who needs to
>> reserve space invokes txnmgr_force_commit_all(). Everyone waits for
>> commits completion. After this fstrim grabs all possible space again
>> (there is no any queue for free space reclaimers). Process X returns
>> ENOSPC.
>>
>> Edward.
> I've meant "grabbing all space and then allocating all space" -- so there won't
> be multiple grabs or multiple atoms.
>
> Then all processes grabbing space with BA_CAN_COMMIT will wait for the discard
> atom to commit.


It seems such waiting will screw up the system. No?


>   (Actually, there is a small race window between grabbing space
> and creating an atom...)


Which one?


>
> The only problem is to wait for (sbinfo->block_count == sbinfo->blocks_used +
> sbinfo->blocks_free) condition, i. e. until no blocks are reserved in any form,
> and then to grab all space atomically wrt. reaching this condition.
>
> Again, if this is not feasible, I'll go with the multiple atoms approach. I
> just want to make sure.
>

