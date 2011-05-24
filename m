From: dE <de.techno@gmail.com>
Subject: Re: reiser4 + loop + NFS = disaster.
Date: Tue, 24 May 2011 09:36:14 +0530
Message-ID: <4DDB2EB6.8070906@gmail.com>
References: <4DD7E3C9.3030103@gmail.com>	<4DD7E8D0.2090300@gmail.com>	<4DD87F64.2040407@gmail.com>	<4DD8EDD1.7040401@gmail.com>	<4DD924DA.208@gmail.com> <BANLkTin45nagasS8ZbpREMx2tryn1LQgYw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=rOz3DYMmKZ+p9DIAOkcsgZ2A1M/bp5fFGPSa0xroiWA=;
        b=AphshkdPV2NkEpEFXduZXPvnljJwlKsdSyVAvVPyYI25O2l0s3FmwO/SsJbUZPVtTA
         qfSb63Ts4v9+F6izeAbYrikvxXJXss79KEHcKWzkF+z15lu4vtoH1Qp3hE9qoqCUn0Z2
         dkNOg4wLZJRNpIXHHPlw5fcz/C+jphk7k6DHg=
In-Reply-To: <BANLkTin45nagasS8ZbpREMx2tryn1LQgYw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

On 05/22/11 21:51, Edward Shishkin wrote:
> On Sun, May 22, 2011 at 4:59 PM, dE<de.techno@gmail.com>  wrote:
>> On 05/22/11 16:34, Edward Shishkin wrote:
>>> On 05/22/2011 05:13 AM, dE wrote:
>>>> On 05/21/11 22:01, Edward Shishkin wrote:
>>>>> On 05/21/2011 06:09 PM, dE wrote:
>>>>>> I've been trying to loop mount reiser4 which resides on a file on an
>>>>>> exported NFS partition, it mounts fine but when copying a lot of small
>>>>>> files inside a complex directory tree everything just hangs all of a
>>>>>> sudden, in fact the whole share hangs. Any operation on the share
>>>>>> (including bash completion) will hang bash (or in that case any
>>>>>> application) completely.
>>>>>>
>>>>>> Doing the same will work with any other FS. Parameters for reiser4 -
>>>>> which kernel is on NFS server?
>>>>>
>>>>> Thanks,
>>>>> Edward.
>>>>>
>>>> 2.6.32-debian.
>>> Could you please upgrade to the latest one (.38)?
>>> I remember there were some problems with loop
>>> devices over reiser4 files that have been fixed.
>>>
>>> Thanks,
>>> Edward.
>>>
>> Humm.. does it matter? It's just a server (it doesn't even have reiser4
>> support). The client matters, that's 37.
>  From your message I have understood that you export a file which is on
> reiser4 partition.
>
> Anyway, I don't consider complaints on -zen stuff. Perhaps this is
> problem in reiser4, but it would be better to make sure that it is
> reproducible in the configuration vanilla kernel 2.6.38 +
> reiser4-for-2.6.38.patch.
>
> Thanks,
> Edward.
>
>>>   Client is 2.6.37-zen (Gentoo)
>>>>>>
>>>>>> create=ccreg40,compress=gzip1,compressMode=force,fibration=lexic_fibre,formatting=tails
>>> "formatting=tails" makes sense only for default file plugin (creg40).
>>>
>>> Thanks,
>>> Edward.
>>
It looks like the Zen kernel is a complete piece of rubble, you're 
right. It shows many other reiser4 related problems with systemrescuecd 
doesn't. There're a lot of non-reiser4 related issues too.

Speaking of which I was wondering about switching directly to 2.6.39, is 
a patch for 39 on the horizon?
