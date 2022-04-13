From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 on an inherently read-only block device
Date: Wed, 13 Apr 2022 22:41:56 +0200
Message-ID: <7b40d91e-0baf-bbea-4b1d-b1f3822f5a02@gmail.com>
References: <c80ff400-479f-0730-506b-5a1e8edf9e82@thinlinx.com>
 <879c3df3-e369-797f-a412-022621d738be@gmail.com>
 <2e1311cd-008a-b689-c43c-bcdc0dc773fc@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fmTP4Hewin840Kc+LvJLYewQpdY96hwkeXjTNL6v4Zk=;
        b=LTdeDF1wW4nXrwF6jKvqDwiWCECUkxCEYO5R2E7SaAwSKKqgvPwDbWOnAE4yx8mmuT
         jDBajhtyXOJs+EiFs6fy01pnq4CJl/EqB/aL2dLb6gk8iHojVMeExwKROQkzPXOJLBK0
         96G4oiNwcJHFlth6hqCKvnOwSsyMYB7Y6No64VTNJo7V09vTwNj01FJJWY9/BIhpwM+2
         DMIcJTXbyCNjvUN1wMa1EibrX2lDluNSu+RleIRn0d6UI4Y30pi7H6/hgf1VdPp26yAo
         0DvHpP0PRaUp5mJHMHuWyCdQcZzBw778R79CKDSZmV8vUJgxBoNisqxNfaWetDF1631k
         WOgQ==
In-Reply-To: <2e1311cd-008a-b689-c43c-bcdc0dc773fc@gmail.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Paul Whittaker <pawhitt69@gmail.com>, reiserfs-devel@vger.kernel.org
Cc: John Nicholls <john@thinlinx.com>



On 04/13/2022 03:56 AM, Paul Whittaker wrote:
> 
>>> Reiser4 is almost perfect for our (thinlinx.com's) needs except for 
>>> one problem: it wants to write to the block device even when mounted 
>>> read-only,
>>
>> After issuing a "mount -o ro" command, reiser4 can potentially issue
>> write IO requests in the following cases:
>>
>> 1) Upgrading Format Version (it happens when you mount a reiser4 volume
>>    of format 4.X.A in the system with reiser4 module of software version
>>    4.X.B, where B > A).
>> 2) Your volume has uncommitted transactions, that should be replayed.
>> 3) Other possible mount-time cases that I don't remember.
>> 4) Possible bugs in reiser4 code (e.g. ignoring the read-only flag in
>>    the write(2) context, etc).
>>
>> From your message it is not clear, which one takes place in your case.
> 
> I'm not sure either.  I thought I could rule out (1) and (2), but now 
> I'm not so sure.  (1) could potentially be a problem, but we can work 
> around that procedurally if necessary.
> 
> What is sufficient to guarantee that the volume has no uncommitted 
> transactions?  Simply unmounting cleanly?  If not, would integrity 
> checking it with fsck.reiser4 do this?


Yes and yes.
Make sure that the volume was cleanly unmounted. If not, then check it
with fsck.reiser4 - it will replay all uncommitted transactions (and
repair, if needed).


> 
>>> and handles errors ungracefully (read as: crashes and burns) when it 
>>> can't - specifically, when performing the umount operation.  I 
>>
>> So what exactly happens at umount?
> A kernel thread panic somewhere in the reiser4 code that results in the 
> umount operation getting permanently stuck.  I'll provide the exact 
> error messages if/when I can reproduce it (see below).
>>> haven't been able to devise a simple reproducer for this, e.g. using 
>>> a tiny ISO9660 filesystem, so there must be some subtleties that I am 
>>> unaware of, but it happens 100% of the time when using our real data.
> 
> My apologies, this is apparently no longer true.  I evidently haven't 
> re-tested this for some time, and am now having trouble reproducing it 
> at all, even with our real data.  I'll test further and get back to 
> you.  It's possible that my preparation methods are at fault, and I am 
> not being careful enough to ensure all transactions have been 
> committed.  It's also possible that my problem got fixed since I last 
> tested (but I'm pretty sure that there have been no relevant commits 
> since then, so that seems less likely).


Ok


> 
>> Yeah, some "non-enterprise bits" still take place in reiser4, mostly
>> because of restricted development resources. Right now I can help only
>> with 100% reproducible scenarios provided..
> Understood - I'll try to find a simple and reliable reproducer.
>>> We have a couple of use cases that necessarily involve inherently 
>>> read-only block devices:
>>>
>>> 1) We want to provide an ISO9660-based installer for our O/S that 
>>> contains a Reiser4 (kinda-sorta-)root filesystem image that the 
>>> installer would mount read-only via loopback to inspect certain files 
>>> prior to dd'ing it to a target disk.
>>>
>>> 2) We want to share a copy of the Reiser4 (kinda-sorta-)root 
>>> filesystem, which is mounted read-only on a writeable medium, 
>>> read-only via the ATA-over-Ethernet protocol for use by 
>>> network-booted instances of our O/S (this is feasible because the 
>>> *real* root filesystem is AUFS with a couple of additional writeable 
>>> layers).  The resulting /dev/etherd/eX.Y block device is inherently 
>>> read-only - if it isn't, we risk write contention and Bad Things.
> 
> I don't think I explained that clearly enough, given your comments below.
> 
> Under normal (product use) circumstances, the Reiser4 filesystem in 
> question is *never* mounted read-write.  It's intended as a base 
> "firmware" layer for our embedded Linux thin client appliance, and on 
> top of that we have a persistent writeable middle layer (an ext3 
> filesystem) and a non-persistent tmpfs top layer, amalgamated via AUFS 
> into a root filesystem.  Changes occur in the top layer, so that in the 
> event of sudden power loss the system will always reset to a known good 
> state (base layer + middle layer + empty top layer, changes since last 
> reboot lost). During a graceful shutdown, top layer changes are 
> *selectively* committed to the middle layer in a *brief* write burst, 
> minimising writes to what is likely to be flash storage (the majority of 
> our customers use Raspberry Pi hardware with SD cards as storage) and 
> also minimising the potential-for-data -loss window (further mitigated 
> by ext3 journaling).  If something goes wrong, the user has the option 
> of reinitializing the midlayer (and the top layer also, of course) to 
> effect a reset to "factory defaults".  At no time, other than during the 
> development process, is the Resier4 base layer ever updated.


Ahh, now it is more, or less clear to me.


> 
> You're probably wondering why we are even interested in Reiser4 for such 
> a use case, since we're failing to make much use of the vast majority of 
> its features.  The answer is, we need (i) compression, (ii) support for 
> volume labels and UUIDs, (iii) something that works under AUFS, and (iv) 
> for our own convenience, preferably something writeable (it is extremely 
> inconvenient to have to recreate an entire filesystem to test a trivial 
> change!). Ext2/3/4 - which we used to use - fails (i), SquashFS fails 
> (ii) and (iv), Btrfs fails (iii).  Reiser4 ticks all boxes.  The only 
> other thing that satisfied all these requirements was E2compr[.sf.net], 
> and it is 99% dead.


I agree, that Reiser4 is the best choice for this: it saves compression
ratio of the algorithms (same as SquashFS does), plus it is read-write.

Btrfs and E2compr actually also fail (i) because the compression ratio
of algorithms they use is eaten by internal fragmentation. To save the
ratio, you need to chop the compressed flow into chunks of needed length
and pack them tightly in the blocks, which is not their case.


> 
>>> Unless I'm missing something, Reiser4 doesn't provide any mount 
>>> option that would permit safe operation in the above use cases. Btrfs 
>>> provides a "norecovery" a.k.a. "nologreplay" option that allows 
>>> suppression of transaction log replay in situations in which the 
>>> integrity of the filesystem is already guaranteed.
>>
>> What are you going to do in cases when the integrity is not guaranteed
>> without log replay?
> 
> That situation shouldn't ever arise.  If it does, the fault is mine and 
> not Reiser4's.


Thus, you can guarantee that reiser4 volume of your base layer is always
cleanly unmounted, or checked by fsck. Correct?

If so, I would recommend to test read-only mounts on cleanly unmounted
volumes to make sure that cases (3) and (4) don't take place. If they
do, please provide us with instructions on how to reproduce - we'll
think how to suppress the writes.

Thanks,
Edward.


> 
>>> Is it possible to add a comparable mount option in Reiser4?  It seems 
>>> to me that read-only should mean **read only**!
>>
>> Yeah, it is possible. Reiser4 does not distinguish between critical and
>> non-critical logs though. However, it is possible to use a 
>> "write-anywhere" transaction mode (mount option "txmod=wa"), in which 
>> only
>> system blocks are logged. So that *all* logs are critical and you can
>> not simply ignore them without breaking consistency. Again, here is an
>> interesting question: what to do with not cleanly unmounted volumes,
>> specifically, if there are logs to replay? Refuse to mount? Are such
>> failures acceptable for you? 
> 
> Absolutely.   That should never occur at any time - if it does, it's 
> because I've misunderstood something about how Resier4 works.
> 
> 
