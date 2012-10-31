From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [FIXED?] reiser4: problem with key inconsistency
Date: Wed, 31 Oct 2012 19:43:06 +0100
Message-ID: <5091713A.4000000@gmail.com>
References: <508DA9FE.5060005@gmail.com> <2414795.eiFhpRrsg9@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=Yqt3FapWco1DFccBwP5IvZaLc4TIIM0Tt83RpY5BtWI=;
        b=hD1HuMx1ny4sq728keeV8GC0Tq8EXDMt7MHl91A1b3h5YO+sELmjKaQ4WvbA9OyOrk
         G0dWOe9llS1BK/5grsqL6xmUhUkjCQIRDbbhrAMG4Lrct6SL/WZzN/1kDHo8wToIsMI8
         GKJBTW86TXD+sjAb4H2/dupbUa4QMRImZOptEtLK2ZUcvrQddVTKk3ExCEMYhBzKYWuE
         aMSG61ZUnMwK9z/4uSnlFz6tSIzsYmVXXY556G04lBKl1BgreyQvz9BsZH24Qgy7JgAD
         EhSDlFKBVavrV8ixH9LjyAFa0bf8QHbvzMl2O0ydbIp0m1u7llK2xRmTwlvr6kEfouqs
         7sPQ==
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


Hmm, strange..
It has gone for me.. At least, my machine works already
110 hours without complaints (before fixing I encountered
this usually in 30-50 h). Well, I'll continue stressing.

Anybody else has the problems with the patched stuff?


> Fsck said SIGSEGV, so I had to restore from a daily backup. Don't kno=
w if that
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


May I ask you also to test your partition with badblock program?

Thanks,
Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
