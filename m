From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [BUG 4.5.3.patch] kernel BUG at fs/reiser4/plugin/file/file.c:820
Date: Thu, 11 Aug 2016 20:02:56 +0200
Message-ID: <CADW=+3ns697idYnM5SS=wN+fCogx28iN5wjDRh6NDPAL3zV1tg@mail.gmail.com>
References: <CADW=+3kQ+CrNqGYZ+EEHqj+rV_qQvE-_cE7XzYGJJ3Fgo30GUQ@mail.gmail.com>
 <a103c9d7-fa39-7572-09e6-acbd38741368@gmail.com> <CADW=+3kAbAiks54vP2MrzQhfzpQcsVFvjuUbH_sGdfru0MPzVg@mail.gmail.com>
 <a4cc8275-7246-2a4c-30cc-089029db4432@gmail.com> <CADW=+3mY=qZep_MGQxgNxg9ermmvOi-sDv41da0NzyBFfwYUTA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mmiM1DFxYPBNZ4OmHqdYODINpx1bx1AbZzaj7e+vUHk=;
        b=s72ZulWZCWRFuUwR1DWpu7AEwfL1HE+TRT8HEYhKTUyLyK9SUOgzP5VUDrSfWjrhJc
         OW1oW91scCtxk/ViHWHvomcs0/wIqN7bDw/FIAZED/1iRKte7jHn4oUj1S8ftlj8HDIV
         eSRI8vuZQaBuzwxy5dOMTbW7xLGjmOn41XCn+r2ycawpTGqFdO4IbyG//XEQTf/bHi7F
         0/+lD1G6y70EuCaU+61kub9mJK/XiobxUQZWdU+F1pt09rDLtUFrtgP+dk5F3C9S0emC
         68ZtphvbXAK1jO3h02QJkfab20Dgko1dHZGOZEtDT/+Hwp5FwE9/2pGBWt8ONe4r8c2w
         IQSw==
In-Reply-To: <CADW=+3mY=qZep_MGQxgNxg9ermmvOi-sDv41da0NzyBFfwYUTA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Thu, Aug 11, 2016 at 11:31 AM, Dušan Čolić <dusanc@gmail.com> wrote:
> On Thu, Aug 11, 2016 at 11:27 AM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> On 08/11/2016 11:20 AM, Dušan Čolić wrote:
>>>
>>> On Thu, Aug 11, 2016 at 11:17 AM, Edward Shishkin
>>> <edward.shishkin@gmail.com> wrote:
>>>>
>>>> Interesting...
>>>> What is your CONFIG_REISER4_DEBUG status?
>>>>
>>> krshina3 dusan # zcat /proc/config.gz | grep REISER4_DEBUG
>>> # CONFIG_REISER4_DEBUG is not set
>>
>>
>> It's correct.
>> Is it annoying/reproducible?
>>
> No, happened for the first time after 1 month runtime.
>

And of course those were the famous last words.
Happened just now again.
I was playing some youtube video and changed in firefox both times but
I don't know if that's related.
Only if the GPU driver stomped over R4 .
>
>>
>>
>>>
>>>
>>>
>>>> Thanks!
>>>> Edward.
>>>>
>>>>
>>>> On 08/11/2016 10:51 AM, Dušan Čolić wrote:
>>>>>
>>>>> With reiser4-for-4.5.3.patch I got kernel BUG at
>>>>> fs/reiser4/plugin/file/file.c:820
>>>>>
>>>>> System froze and there was nothing in logs after restart but I made a
>>>>> photo of log (attached).
>>>>>
>>>>> krshina3 dusan # cat /etc/fstab | grep -v '#'
>>>>> /dev/sda1               /boot           ext2            noauto,noatime
>>>>> 1
>>>>> 2
>>>>> /dev/md123              none            swap            sw
>>>>> 0
>>>>> 0
>>>>> /dev/sda2               /               reiser4
>>>>> noatime,onerror=remount-ro              0 0
>>>>> /dev/md125              /mnt/backup     reiser4
>>>>> noatime,noauto,onerror=remount-ro       0 0
>>>>> /dev/md126              /mnt/media      reiser4
>>>>> noatime,users,onerror=remount-ro        0 0
>>>>> /dev/md127              /usr/portage    reiser4
>>>>> noatime,onerror=remount-ro              0 0
>>>>> /dev/dvdrom             /mnt/cdrom      auto            noauto,ro
>>>>> 0
>>>>> 0
>>>>>
>>>>> shm                     /dev/shm        tmpfs
>>>>> nodev,nosuid,noexec     0 0
>>>>>
>>>>> All reiser4 partitions are ccreg40.
>>>>>
>>>>> Thanks
>>>>>
>>>>> Dushan
>>>>
>>>>
>>
