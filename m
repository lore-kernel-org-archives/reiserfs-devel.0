From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [FIXED?] reiser4: problem with key inconsistency
Date: Mon, 7 Jan 2013 12:05:31 +0100
Message-ID: <CADW=+3=ZsVyNg_m3Rm186GDLB2m-31OwuOEggLVvqUZO4koBxg@mail.gmail.com>
References: <508DA9FE.5060005@gmail.com>
	<2414795.eiFhpRrsg9@intelfx-laptop>
	<50954002.50105@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=DT+k9pLlkzFcC4SoZL1MT1NVbE4+vCKrCGC97apUMA8=;
        b=VVuA3Rn+8H+xSmxLfq0SXiYU2rONzjlCpsc/MEcDRbptmwLWyyw/rRIHWQshbF4b0H
         L2HdaEasvQrkVlimhvIiEbd9wTUKbgZTt6yBSCSjDdbuSjVCoQqeZbecjdd+J068hwv6
         p51w1x0W+7lnUXBVoqu/Z1xTufo9nPXxtLOSEuJr/IwDcmg3F2TrAEXhWhXcCB1N3pub
         iX2rHS/OAdkB/UCfl7HqIsN/5JgS0w0Gu7i7Wm8ViQBP3EzEeXD53UsVWpnGtsTyxFK1
         wKVoY/Q6xibzFDQjv8fFbYUp5Y+ERuo9HchQK5hPkdixt1hI5W00KDFfGr3jvU+skGvv
         PkoA==
In-Reply-To: <50954002.50105@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

On Sat, Nov 3, 2012 at 5:02 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 10/31/2012 06:24 PM, Ivan Shapovalov wrote:
>>
>> On 28 =D0=BE=D0=BA=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2012 22:56:14 Edwar=
d Shishkin wrote:
>>>
>>> Hi all.
>>> It seems I do have the long-awaited fix.
>>>
>>> The symptoms of the problem: kernel starts to issue complaints
>>> about key inconsistency with the suggestions to check the partition
>>> with fsck. Fsck sometimes finds corruptions, but sometimes reports
>>> that file system is consistent.
>>>
>>> Please apply the attached patch to reiser4 stuff for 3.6.2, or
>>> download reiser4-for-3.6.4 (which already contains this patch), and
>>> let me know if the problem has not gone:
>>> http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x=
/
>>>
>>> Please, don't rush to deploy production systems on reiser4: it can
>>> take up to 80 hours to reproduce the problem with high workload.
>>>
>>> Thank you for your help.
>>> Edward.
>>
>>
>> Alas, it hasn't gone... Or maybe it's a different problem, but today=
 (on a
>> debugless build) I've got a massive crash (mostly -2 and -5 errors f=
or
>> different VFS operations - e.g.
>> nikita-717/edward-1611/edward-430/nikita-2219/nikita-2221, many vs-3=
533
>> and
>> edward-1460/edward-1608/edward-156 warnings).
>> Fsck said SIGSEGV,
>
>
>
> There are pending patches for reiser4progs, please don't forget to ap=
ply
> them when checking your partitions:
>
> http://marc.info/?l=3Dreiserfs-devel&m=3D129703129519745&w=3D2
> http://marc.info/?l=3Dreiserfs-devel&m=3D127504471326353&w=3D2
>

Is this bug fixed in 3.7?

What is blocking the release of reiser4progs-1.0.8  with those pending =
patches?

Are there some other open bugs?

Thanks
Du=C5=A1an

PS. Sorry for sending this again, vger.kernel.org rejected my first mai=
l.


> Thanks,
> Edward.
>
>
>
>  so I had to restore from a daily backup. Don't know if that
>>
>> is related to allocator, but anyway.
>>
>> And I don't have much time these days to set up VM with a clone of m=
y
>> system
>> for kgdb, sorry... Though I hope I'll do that on next week (on vacat=
ions).
>>
>> BTW, changing RAM didn't help, and old RAM passes memtest - so here =
it's
>> truly
>> a bug somewhere in allocator.
>>
>> Regards,
>> Ivan.
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
