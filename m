From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on /mnt/backup
 failed: Cannot allocate memory
Date: Mon, 03 Nov 2014 16:25:27 +0100
Message-ID: <54579E67.5070907@gmail.com>
References: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com> <CADW=+3nzK0rLpQR-+rhn_siKCYr5mSSbfkyyw5NXgagZWEPLvA@mail.gmail.com> <54578AC2.3040803@gmail.com> <1897499.AEq9pxZicq@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=DXjtEUxMd2f11rGCfMpZGzk2TS6jjoZEaoyJt6XlKto=;
        b=El37i+L5DUC2rPlWZO5lf9v7fwm5fynIRVI/a/z2P3gjI/bQ1gop6A0B2hg0WEv/Pu
         yuj+ZzG58T6A35C4Svm8tDnd1jsGjoCHVs/R3uqRvVBJ1VT2Ps3VprIYHtCOqrvJPPEi
         gbEed9bHqwReDVLgEj4x2faRBSBL2dSXRqqtqFQeUTwzdl7wJXmnZBGNhwGjuC9G6A7T
         tw72tLJLV+AHN3m7q939jEVB/05d9q87SLTnoK5o7qPNcIe6V71R84v69P6ncQ+ViNqI
         H4ZdnZNBYqOAC2aoPygGUQk3gWIsjtSJujhuEOJFs3vWGfVc2npCt+Um9dP03FPPX2Qe
         Jd6Q==
In-Reply-To: <1897499.AEq9pxZicq@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 11/03/2014 04:12 PM, Ivan Shapovalov wrote:
> On Monday 03 November 2014 at 15:01:38, Edward Shishkin wrote:=09
>> On 11/03/2014 02:56 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>
>>> On Nov 3, 2014 2:36 PM, "Edward Shishkin" <edward.shishkin@gmail.co=
m
>>> <mailto:edward.shishkin@gmail.com>> wrote:
>>>> Sorry, Can not reproduce.
>>>> I have create a ticket http://sourceforge.net/p/reiser4/tickets/3/
>>>> will keep this in mind.
>>>>
>>>> Thanks!
>>> Will it help if I try earlier kernels?
>>> How can I find what file crashes it?
>>>
>>
>> Somebody steals pages of compressed file's address space.
>> It can be e.g. because of races. I don't have any ideas except
>> code inspection...
> Do you remember the migration issue? Can't it be related?


I don't think so: page migration is disabled in reiser4..


> (btw, reiser4's pages are still non-migratable...)


You still sit on the patch, which enables migration?

Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
