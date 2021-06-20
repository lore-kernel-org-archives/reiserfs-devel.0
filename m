From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [reiser4 SFRN 5.1.3] kernel [5.10.x] read not supported for file
 /test-exec \(pid: 10094 comm: debootstrap\)
Date: Sun, 20 Jun 2021 19:45:23 +0200
Message-ID: <1f342fdd-0c30-06df-012c-4425d94d942f@gmail.com>
References: <20210208125427.CFC7C75EED90@huitzilopochtli.metztli-it.com>
 <e37d5585-318e-3130-82c9-7a740b9af8af@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=/0JkYZFOFTiVQwfdqrwqNFO1ekacGZPU/6iRM/c6W0g=;
        b=L+q4GdHoMfaZdklCBgtr/Pk3a2ZNn9QlLuvtvmjM9NY3NSUV8Aawdjqblxy0jqGNzc
         2/e76SARJroXZXgA3rSWNiVxAwrWffBY7yEwjTgI5A/lyR2W0IsEtB1BT99IM37hRpa8
         lt+KmryfnlrSP6k9LOAXhMXxSClxrpVRwdoJAC5ImRtBNuXZuqlnrEVgEEnrSU2fRMx0
         oEJ6OrALB2NSwyPgKo2AEPbClUJ7FdZEJnn43yUqIkMRf69rawYSW9emzGUWZtJ0ed8r
         OxH6U6DLZHBI/HaDz8/lo7VQmnCAvNCQ39KivjSNPhYInKeT8CVtxhOgezS0n8NmH5Ui
         xLAA==
In-Reply-To: <e37d5585-318e-3130-82c9-7a740b9af8af@gmail.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Metztli Information Technology <jose.r.r@metztli.com>, reiserfs-devel@vger.kernel.org

On 02/08/2021 05:03 PM, Edward Shishkin wrote:
> On 02/08/2021 01:54 PM, Metztli Information Technology wrote:
>> On Wed, Dec 23, 2020 at 3:40 PM Edward Shishkin 
[...]

>>>
>>>
>>> Hello.
>>>
>>> This is because of VFS changes in Linux-5.10.X.
>>> Specifically, because of the following patch:
>>> https://lkml.org/lkml/2020/8/17/174
>>> In the upstream git repository it is commit 4d03e3cc59828c82ee89ea6e2
>>>
>>> So, Christoph, what to do now for file systems which implement
>>> ->read() method of file operations?
>>
>> *deafening silence* it appears that -- in the best of cases -- 
>> Christoph engaged in an act of _iter masturbation [1];
>> and in the worst of cases, the gentleman was aiming straight at reiser4.
>>
>>> ... It seems that chroot doesn't work
>>> for them. And people are not able to release distros with upgraded
>>> kernels..
>>
>> Not only 'chroot doesn't work' for us, but even after replacing the 
>> kernel in a reiser4 (proper SFRN ;) instance and
>>   upon an initial Linux 5.10.x kernel boot:
>> ...
>> kernel read not supported for file usr/lib/systemd/systemd (pid: 1 
>> comm: run-init)
>> kernel panic -- not syncing: Attempted to kill init! exitcod=0x00000100
>> ...
>>
>> Fact is some of us have commercial interests when deploying reiser4, 
>> both in cloud instances, baremetal, and on-premises.
>>
>> In the future if -- and only if -- our reiser4 efforts come to 
>> successful fruition, quite likely in due time we will be
>>   able to financially commit to the Penguin's Linux Foundation temple, 
>> just like large corporations do
>>   in exchange for indulgences[2] which virtue-wash their past and/or 
>> current corp. officers' *substantially darker deeds*;
>>   heck, 'indulgence trafficking' seems to assuage->numb->arg(STFU) 
>> that 'virtuous' cult of GNU/Linux
>>   developers/gatekeepers/maintainers' frivolous, *narcissist*, ethics 
>> and/or moralities so often piled up against
>>   Reiser's work --which, paradoxically(!?), actually was largely 
>> implemented by Russian developers ;)
>>
>> In the meantime, I hacked a reverse patch that undoes some(all) of the 
>> surreptitious lethal attack on reiser4 fs
>>   -- at least on AMD64 architectures (I did away with other 
>> arch/Kconfigs).
>> And no, I am not a git pro-, undoing what I could of commit 
>> 4d03e3cc59828c82ee89ea6e27a2f3cdf95aaadf (as your hinted, Ed)
>>   does not fix the 'kernel read' issue.
>>
>> Notwithstanding, I would appreciate if you can take a look at the 
>> attached patch. Probably it can be streamlined and/or improved
>>   further to minimize pain on subsequent Linux kernel upgrades.
> 
> 
> That patch is an attempt to swim against the current ;)
> 
> I no longer remember, why they want to get rid of set_fs for already 15
> years, but ->read() and ->write() methods seem to be deprecated, and the
> correct way would be to implement the new ->read_iter() and write_iter()
> methods, where reiser4 works with "chunked" streams, represented by
> iov_iter structure, rather than with "continuous" streams, represented
> by char __user *buf. The task is not that difficult, but rather time
> consuming - I don't have a time for this right now..


So, I have implemented ->read_iter() for all plugins (*). It is included
to reiser4-for-5.12 stuff. Not sure if it is enough to make distro with
root over reiser4 though: ->write_iter() is not yet implemented (not so
trivial because of transactions).

(*)
https://github.com/edward6/reiser4/commit/ac72aba7e8bb16a28755c1b2b762971927d17c3c

https://github.com/edward6/reiser4/commit/4d3200fbcb2003c680cdb822e3f616d3fa83c391

Edward.
