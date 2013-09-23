From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Mon, 23 Sep 2013 23:21:48 +0200
Message-ID: <5240B0EC.30203@gmail.com>
References: <20130919151403.Horde.VoBIXKovROrctv021aPeYw7@mail.thieu.so> <5240900B.90800@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=Q3AMrjkrXTm5YY3Z89MpE/01dQziU5FOQMM8RS7SX3E=;
        b=ywpsl3Z9HxqcYKZud5mTwC0ziz+KLeJb/0zUyj4TdWFR5l6jQ6rpA4mRKvwufTeROd
         E35B7eb5LD4LVpTO4GOcqCpIPhTAahsYg1OPSuTKI8pP6B2xssCXbuzGpfSl1BwInmv/
         /BnmhDeaggycRm8TIo9xZY9CN5HIddRGkhuGfmY9GRECTx0SguRxMz/RF1Vp0v5HJubd
         ovzcoNZM3t++3NwoRLrreh+SvOWwDOuTlwVrOmqYsYYzTAsLEDS9GEpkhF8nW0amXu/S
         kTaIMOnZpB6U142fnz1+kUtrCfvj3max3cw7NDHkm3sqW8C7XZwjhHU9X5LqSnFZU4ls
         xdnQ==
In-Reply-To: <5240900B.90800@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: m@thieu.so
Cc: Chris Gentile <cnjgentile@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

With this patch I do have the following:

[root@pepelac ~]# rm -rf /mnt/*
rm: cannot remove =E2=80=98/mnt/stress/10=E2=80=99: Directory not empty
rm: cannot remove =E2=80=98/mnt/stress/2=E2=80=99: Directory not empty
rm: cannot remove =E2=80=98/mnt/stress/4=E2=80=99: Directory not empty

However, this is because of races: when there is no any
contention, the directories can be successfully removed.
Not sure, if such behavior is POSIX compliant though...

Edward.


On 09/23/2013 09:01 PM, Edward Shishkin wrote:
> On 09/19/2013 05:14 PM, m@thieu.so wrote:
> [...]
>>
>> For the undeletable directory bug, i was able to reproduce it with=20
>> 3.10 simply by copying portage on a r4 partition, do ctrl-c during=20
>> copy and rm -rf it right after.
>
>
> Unfortunately, I can not reproduce this.
> Could you please try the attached patch? Does it help?
> Better, on not important data...
>
> Thanks,
> Edward.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
