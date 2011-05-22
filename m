From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 + loop + NFS = disaster.
Date: Sun, 22 May 2011 13:07:11 +0200
Message-ID: <4DD8EE5F.3000009@gmail.com>
References: <4DD7E3C9.3030103@gmail.com> <4DD7E8D0.2090300@gmail.com> <4DD87F64.2040407@gmail.com> <4DD8EDD1.7040401@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=PTDbMitmdKKQ8O7oRZdl/497S98zai3LkTqKV6Am7y8=;
        b=yBN6rUUzNvFHDrPIQHdVpQuE2BUY6UIHpwurHNIRXcsheG3b7FYZ6ea0Sw33p1sUsC
         TPPBafbEApH0JQbkxUJiv+3Le+rOpvV0fo2CyFJeIROgtB+C9GKabTwlrs6yEACqXdvx
         8NCUk9f6Rk1UpjW4tO3JzgqBsFiq2WO6F7q8M=
In-Reply-To: <4DD8EDD1.7040401@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dE <de.techno@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 05/22/2011 01:04 PM, Edward Shishkin wrote:
> On 05/22/2011 05:13 AM, dE wrote:
>> On 05/21/11 22:01, Edward Shishkin wrote:
>>> On 05/21/2011 06:09 PM, dE wrote:
>>>> I've been trying to loop mount reiser4 which resides on a file on an
>>>> exported NFS partition, it mounts fine but when copying a lot of small
>>>> files inside a complex directory tree everything just hangs all of a
>>>> sudden, in fact the whole share hangs. Any operation on the share
>>>> (including bash completion) will hang bash (or in that case any
>>>> application) completely.
>>>>
>>>> Doing the same will work with any other FS. Parameters for reiser4 -
>>>
>>> which kernel is on NFS server?
>>>
>>> Thanks,
>>> Edward.
>>>
>> 2.6.32-debian.
>
> Could you please upgrade to the latest one (.38)?
> I remember there were some problems with loop
> devices over reiser4 files that have been fixed.
>
> Thanks,
> Edward.
>
>
> Client is 2.6.37-zen (Gentoo)
>>>>
>>>> create=ccreg40,compress=gzip1,compressMode=force,fibration=lexic_fibre,formatting=tails
>>>>
>
> "formatting=tails" makes sense only for default file plugin (creg40)

s/creg40/reg40/
