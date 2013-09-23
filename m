From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Issue in my API re-implementation in my kernel 3.11
Date: Mon, 23 Sep 2013 11:01:16 +0000
Message-ID: <52401F7C.2040309@gmail.com>
References: <20130921031821.Horde.7huC_KAbvhnsxkwHkVoEVg2@mail.thieu.so> <CABYXC3a+Mg1iZiFH3x-RCFbKweG2KyoTbPMa49-4212SzKMdww@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=9p01uzImzyMKB8GvkdkSphyr6s7l/fAfjb3ns5zSWiI=;
        b=rJ+YMqDEP9y03/Wb6W65s+7mPF4uiyB8tui/l1QvA9EAe5Ls5sgOljw+zVoSL6WXp8
         vK9dR6vEf3+Suj/hDHpyhTqBBi/xhT1X4uAIuaygr7KFqJK/9cTC+48NKTBfwoXxMpa3
         MUWB9HHuFoMh6/8EhQSiHsswteFcf2yiPGaVmMQSlrTrsIeOEYoArJm75PcfUdUffqiV
         OA1rSw+/dBAh8Vob65h4ZnWEi9pJKeRMN62oSDzWMpdexzq0jGEwovi7qAcIUVyRRCUc
         JzSnwtaTWqw1PnKFxQtsXq/kxTXfxz7obXP6L048S6l0jAarPOVDAFQ4zT0+iaxm72xm
         CRMg==
In-Reply-To: <CABYXC3a+Mg1iZiFH3x-RCFbKweG2KyoTbPMa49-4212SzKMdww@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mathieu Belanger <m@thieu.so>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Mathieu et, all ,

Fixes seemed to have fixed the corruption issue thus far. Re-emerging
1000+ packages on Gentoo (tons of small reads/writes on SSD) with no
problems yet. Also, just downloaded the Linux-next patch from this
morning
(https://www.kernel.org/pub/linux/kernel/next/patch-v3.12-rc1-next-20130923.xz)
and applied on top of your Reiser4-for-3.12-rc1 branch recompiled
re-installed NVidia (thanks for fixing that btw!) and resuming compiling
as we speak. Going strong still and fast.

Not sure if it makes much difference but I use no compression just
mkfs.reiser4 -o formatting=smart on SSD drives.

Are there any special options I should be using on SSD arrays?

Addressing the compression angle, does formatting an array with one of
the compression options (lzo perhaps?) have significant overhead?
Storage space is not a concern however if there is very little overhead
I'd like to backup my data and do some benchmarking.  Please advise at
your convenience.


Thanks again,
Chris

On 09/21/13 19:53, Christopher Gentile wrote:
> I've experienced corruption in the 3.12-rc1 on the git tree and just
> did a fsck.reiser4 --build-fs. Also re-downloaded the tree and
> recompiled as it looks like you've made changes I'll keep you posted.
>
>
>
> On Sat, Sep 21, 2013 at 3:18 AM, Mathieu Belanger <m@thieu.so> wrote:
>> In my kernel 3.11 on my git, I have re-implemented an API because I did not
>> know how to port the reiser4 to the new API (readdir -> iterate).
>>
>> I did not get any problem with reiser4 or reiserfs -but- after installing
>> the 3.12-rc1 kernel and rebooting, the kernel was missing and the grub.conf
>> was total garbage. The /boot is EXT2 on my system.
>>
>> readdir is for reading dir mostly, I don't know if it's the cause of the
>> corruption or if it did not sync properly but still, if you want to play
>> with a ext2 partition and you use the kernel 3.11 from my git, reboot to
>> another kernel before, just as precaution.
>>
>> The kernel 3.12-rc1 is not affected if it's because of that readdir API
>> reimplementation because it's based on the Ivan port + shrinker new API
>> patchs for reiser4.
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

