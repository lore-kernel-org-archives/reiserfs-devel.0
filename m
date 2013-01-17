From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [FIXED?] reiser4: problem with key inconsistency
Date: Thu, 17 Jan 2013 19:40:18 +0100
Message-ID: <50F84592.8070702@gmail.com>
References: <508DA9FE.5060005@gmail.com> <2414795.eiFhpRrsg9@intelfx-laptop> <50954002.50105@gmail.com> <CADW=+3=ZsVyNg_m3Rm186GDLB2m-31OwuOEggLVvqUZO4koBxg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=xW7wkeiGZ15bydUMPdRz6t2Ho8/lZMIfqlYHXv9BY5Q=;
        b=X0dOQOSj3m7IDfg6Br1+E6izjf/PNkr2N64DrN9WytxrkTSnPf24V6DWdd5XSn6Xp5
         rjHkShWCy8/GlP9aK8JYaqtIPoCmKmEaCBQIDokPLdGjsItM9J1hwrrD7DHp9wXoWtkA
         ybsolL8snL1ATQ02jBKGPnVx74Wr6C3y0OKDkpI7htkkzG+nnFN/6IlXiVDGJ55E1NuJ
         7avSZ78SVWWU6rquSrD5mIZPjo8NbRk7Iwuf1JDyKzA2xaiz8GS6GKns36/kzTm2FrUr
         hJo5kqioEmkcnbPMZkyQPhxEu4kpfv4r57UaUX+80mxvg7GRmerRP1jxRQKioN/GtfaO
         H5Sw==
In-Reply-To: <CADW=+3=ZsVyNg_m3Rm186GDLB2m-31OwuOEggLVvqUZO4koBxg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 01/07/2013 12:05 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> On Sat, Nov 3, 2012 at 5:02 PM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> On 10/31/2012 06:24 PM, Ivan Shapovalov wrote:
>>> On 28 =D0=BE=D0=BA=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2012 22:56:14 Edwa=
rd Shishkin wrote:
>>>> Hi all.
>>>> It seems I do have the long-awaited fix.
>>>>
>>>> The symptoms of the problem: kernel starts to issue complaints
>>>> about key inconsistency with the suggestions to check the partitio=
n
>>>> with fsck. Fsck sometimes finds corruptions, but sometimes reports
>>>> that file system is consistent.
>>>>
>>>> Please apply the attached patch to reiser4 stuff for 3.6.2, or
>>>> download reiser4-for-3.6.4 (which already contains this patch), an=
d
>>>> let me know if the problem has not gone:
>>>> http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.=
x/
>>>>
>>>> Please, don't rush to deploy production systems on reiser4: it can
>>>> take up to 80 hours to reproduce the problem with high workload.
>>>>
>>>> Thank you for your help.
>>>> Edward.
>>>
>>> Alas, it hasn't gone... Or maybe it's a different problem, but toda=
y (on a
>>> debugless build) I've got a massive crash (mostly -2 and -5 errors =
for
>>> different VFS operations - e.g.
>>> nikita-717/edward-1611/edward-430/nikita-2219/nikita-2221, many vs-=
3533
>>> and
>>> edward-1460/edward-1608/edward-156 warnings).
>>> Fsck said SIGSEGV,
>>
>>
>> There are pending patches for reiser4progs, please don't forget to a=
pply
>> them when checking your partitions:
>>
>> http://marc.info/?l=3Dreiserfs-devel&m=3D129703129519745&w=3D2
>> http://marc.info/?l=3Dreiserfs-devel&m=3D127504471326353&w=3D2
>>
> Is this bug fixed in 3.7?


So, we have found 2 problems, which led to this kind of corruption
(key inconsistency):

1) nobody updated dkeys (fixed in 3.6):
    http://marc.info/?l=3Dreiserfs-devel&m=3D135146138331012&w=3D2
2) default ->migratepage() didn't work for reiser4 (isolated in 3.7).


>
> What is blocking the release of reiser4progs-1.0.8  with those pendin=
g patches?
>
> Are there some other open bugs?


Since we are not in mainline tree, we'll periodically encounter various
oopses in new releases. However, I think it will be easy to fix.

Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
