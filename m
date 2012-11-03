From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [FIXED?] reiser4: problem with key inconsistency
Date: Sat, 03 Nov 2012 17:02:10 +0100
Message-ID: <50954002.50105@gmail.com>
References: <508DA9FE.5060005@gmail.com> <2414795.eiFhpRrsg9@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=wlZ9fjTQ8GxXRrQ1z4RuFNq5YOdN8HV4MjUugEnG7m8=;
        b=Ek65oRynrTZSFQGLj1/ndqIA5Q2jkMLKGUkf0/a7LWNj6Ehg/gusAks3agmYP1JwkX
         b/oi3dNoQiBXuktmP+wHvaKldvS/RMEi6bzutZwZUQy8oHUMqhqx8bW7TVP9+jYW6P5I
         At8+REXFH5yrGWKSnFH+X8gxYKO10qnpTuNiFzJwfPjGLYLrYT5ggsntFA/urGstDfK/
         gtaWQvaxzMxuJpOIDqQkV/EtZ9Or3pNCqO0APMqJ1daBKD1AFYoGGtSqZglEnPJ5zx7E
         vlHabUP1LZunB5ASYcTMGBVkfZtAfzMWPBxSekUpCWBJcUNqNcif+zXLZLQyRE45xrFo
         fPcQ==
In-Reply-To: <2414795.eiFhpRrsg9@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 10/31/2012 06:24 PM, Ivan Shapovalov wrote:
> On 28 =D0=BE=D0=BA=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2012 22:56:14 Edward=
 Shishkin wrote:
>> Hi all.
>> It seems I do have the long-awaited fix.
>>
>> The symptoms of the problem: kernel starts to issue complaints
>> about key inconsistency with the suggestions to check the partition
>> with fsck. Fsck sometimes finds corruptions, but sometimes reports
>> that file system is consistent.
>>
>> Please apply the attached patch to reiser4 stuff for 3.6.2, or
>> download reiser4-for-3.6.4 (which already contains this patch), and
>> let me know if the problem has not gone:
>> http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/
>>
>> Please, don't rush to deploy production systems on reiser4: it can
>> take up to 80 hours to reproduce the problem with high workload.
>>
>> Thank you for your help.
>> Edward.
>
> Alas, it hasn't gone... Or maybe it's a different problem, but today =
(on a
> debugless build) I've got a massive crash (mostly -2 and -5 errors fo=
r
> different VFS operations - e.g.
> nikita-717/edward-1611/edward-430/nikita-2219/nikita-2221, many vs-35=
33 and
> edward-1460/edward-1608/edward-156 warnings).
> Fsck said SIGSEGV,


There are pending patches for reiser4progs, please don't forget to appl=
y=20
them when checking your partitions:

http://marc.info/?l=3Dreiserfs-devel&m=3D129703129519745&w=3D2
http://marc.info/?l=3Dreiserfs-devel&m=3D127504471326353&w=3D2

Thanks,
Edward.


  so I had to restore from a daily backup. Don't know if that
> is related to allocator, but anyway.
>
> And I don't have much time these days to set up VM with a clone of my=
 system
> for kgdb, sorry... Though I hope I'll do that on next week (on vacati=
ons).
>
> BTW, changing RAM didn't help, and old RAM passes memtest - so here i=
t's truly
> a bug somewhere in allocator.
>
> Regards,
> Ivan.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
