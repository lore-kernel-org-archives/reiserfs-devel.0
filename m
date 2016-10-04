From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Tue, 4 Oct 2016 17:52:17 +0200
Message-ID: <0a727db9-6f81-3bef-f96a-c328e5b6ed66@gmail.com>
References: <57E6DF37.1050702@gmail.com>
 <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>
 <1474944195.1773.15.camel@intelfx.name>
 <1921c810-5d7f-1de0-ec3d-48d123dba41f@gmail.com>
 <1475001384.1609.2.camel@intelfx.name> <57EAE900.8060301@gmail.com>
 <1475013062.1621.5.camel@intelfx.name>
 <b2b6b412-6a80-37d3-0055-3fe84a195afd@gmail.com>
 <1475058981.10051.1.camel@intelfx.name>
 <5aba3b45-ccd5-35bb-96a9-335c78022f92@gmail.com>
 <3d1f6d29-b3a8-1e14-d622-a3e158ec79d1@gmail.com>
 <1475074980.10051.3.camel@intelfx.name> <57EC20E7.8030906@gmail.com>
 <1475099403.10051.5.camel@intelfx.name>
 <314913f7-5bf0-3edc-ad0d-6a88567c0ae0@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=yRhRUeGjBlJlFa5NrXsG8MHXaDZoi6e94EeT8uOcD8o=;
        b=UFUxEA4m9dcHBvDdgP05tgrJAeFubZ+J7n/oxP36wiLk6Ymo3zrHgN2Blr8fsfOw2g
         gJZWN8cReFsuMGPqxC0QY03IMDqo12RPVoHeNCk1sziG4xGneQTaz7+ELMRm0BEgf5QK
         Xlk6o/U6M6AO4sHesmO9iYMV2LFm8lNAcWyGihErldOT/VxDCwGPL52XW0w/jsV8fM8T
         YlVXpD+J8q0zu8/bGAGwVU+bB8uANoSnBgkxEijQ/cjVODDmPZsELxLwEdx8drGd/YiZ
         y0ILlYywEDfV+SGBGxPjVeJ/lbSZT7KxZGyhepteQuG1L88x8pGhZnqHJR20n1qzrwtU
         Wxhw==
In-Reply-To: <314913f7-5bf0-3edc-ad0d-6a88567c0ae0@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

On 09/29/2016 05:07 PM, Edward Shishkin wrote:
[...]
> BTW, your fstrim-scanner is the first candidate to scrub ;)
>>>>> Actually, I think about a common multi-functional scanner, with 3
>>>>> modes:
>>>>> 1) discard only (handle only free blocks);
>>>>> 2) scrub only (handle only busy blocks);
>>>>> 3) combined (scan the whole partition; for free blocks call
>>>>> discard,
>>>>>        for busy ones call scrub).
>>>>> Any ideas?
>>>>>
>>>>> Thanks,
>>>>> Edward.
>>>>> PS: We have an own ioctl number: 0xCD inherited from
>>>>> ReiserFS(v3).
>>>> I still have to finish the erase unit detection (which has
>>>> completely
>>>> stalled) to merge all this work. Moreover:
>>>>
>>>> For the fstrim, we have dropped all locking and serialization
>>>> issues
>>>> and declared that fstrim is best-effort: if it misses some blocks
>>>> due
>>>> to concurrent transactions allocating and freeing blocks, it
>>>> doesn't
>>>> matter.
>>>>
>>>> For the scrub, this won't fly...
>>> Indeed, the requirements to fstrim and scrub are different,
>>> but, as I remember, the last decision was to not miss:
>>> http://marc.info/?l=reiserfs-devel&m=141391883022745&w=2
>>> so everything will fly just perfectly..
>>>
>>> Edward.
>> This is different thing, it's about grabbing space in bigger chunks...
>> If a concurrent transaction allocates some space and frees some space,
>> we don't care, because it will then be discarded "online".
>>
>> But in case of the scrub, how do we protect from the storage tree
>> changing right beneath us?
>
> Yup, it seems that the idea of common scanner is dead.
> It should be an independent tool. I think, we need to simply scan the
> storage tree, do whatever is needed for each node, and make it dirty.

My last thought is that online scrub is not needed.

Global synchronization issues can not happen online. They can happen
only offline (after fsck-ing). Respectively, I suggest to move the
global synchronization stuff to user-space, where it will be extremely
simple (a sort of dd-ing partitions in parallel, plus we'll need a
user-space version of init_volume.c to collect all mirrors properly).

What can happen online is only(*) local fixable problems (when after
IO completion page is uptodate, but checksum verification failed).
There are 2 approaches:

1) Fix those local problems online: if __jparse() detects a local
    problem, then simply issue a "correction" - a write request for the
    original subvolume, and wait for its completion _before_ marking
    jnode parsed (to prevent "rollbacks").

2) In the case of local problem mark status block of the volume to
    indicate that global synchronization is required before fsck-ing.
    Then we forget about all local problems in that mount session.
    I didn't calculate the probability of simultaneous corruption of
    original and replica blocks with the same blocknumbers (don't have
    any input numbers), but I suspect that it is vanishingly small.

So, we need either pre- and post-fsck global offline synchronizations,
or global post-fsck one plus online local self-healing.

----
(*) I don't consider non-fixable IO errors (including death of one or
more mirrors) that you can handle online with block layer's RAID-1.
However, we also can implement such kind of failover in reiser4.
Downgrading arrays is simple to implement. Upgrading ones will again
require global online synchronization (scrub).

Edward.
