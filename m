From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 kernel compilation problem.
Date: Mon, 25 Nov 2013 12:30:48 +0100
Message-ID: <529334E8.40704@gmail.com>
References: <35ffb317ffa4ed9987117759f51ebd1f@mail.velocitynet.com.au> <20131123161309.1b321a45@Ulf.tvoe.tv> <3ff712c55494331e10c9f7fc0b7b8d25@mail.velocitynet.com.au> <20131125135635.36d29c28@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=XjAL1wPB6skvkHYRvozvtqd9LVe6P5WJS9E9+WnuMc8=;
        b=wS3zwUwQkuEUzCEYlpJsYddk9rRG/8Mq6eLH3SuOjQ0gH6ZIDRt6lvJ6apTmmADELh
         Wn4jOZyUsTK+xcWzlULxoEae/Lr6LYeW8o++AsJcOxQftGMrmH5YK0xUep7BdB3GjEdh
         Z4M1U65P7IN+9EuQNd+cThM/8ZDgQFB143bcRIoc7vjWpt4Ijhz4hukiRA2vllkg8Z6C
         Chfu7Kf6pDnz+p5IM6wPiZClU6yh0q/6t9tH8st2qlj7AABPjB8KSIfKadU7YGubdlv0
         yF0N0Kn/AU/haTDK24sioYNneO/trcN6glKNeGysMg55FH5Rb9lxfhZdqtUJgHxY3RG4
         Hx3g==
In-Reply-To: <20131125135635.36d29c28@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru

On 11/25/2013 10:56 AM, dimas wrote:
>> Hello,
>> Here are the details:
>>
>> # insmod
>> Usage: insmod filename [args]
> no-no-no, insmod is used to load module. you must give it a module name to load.
> also there is lsmod, which shows currently loaded modules. read man insmod, man
> lsmod for details.
> so, aftre your mount attempt (not before it, because modules usually load only
> when requested) check if reiser4 module did loaded:
> lsmod | grep "reiser4"
> if it occasionaly shows nothing, try loading it manually, using "insmod
> reiser4" or better
> modprobe -v reiser4
> if this will fail too, there should be a problem with the module itself.
> i'm using no modules, building only what i need, and building it static (=Y).
> static built reiser4 works perfectly wirh 3.11 for me, so i don't know, what's
> that. check dmesg after attempt to load, maybe there is something.
>
>> # ll /proc/filesystems
>> -r--r--r-- 1 root root 0 Nov 25 12:18 /proc/filesystems
> try "cat /proc/filesystems")) it shows list of fs types, which kernel currently
> support
>
>> Back to the Question:
>> What reiser4 kernel build paramerers I need in the kernel build so I can
>> use this partition ?
>> I have set:
>> CONFIG_REISER4_DEBUG=n
>> CONFIG_REISER4_FS=m
> if you are not using cryptocompress plugin (your fsck lock says, you are not).
> i believe, this is enough.


Fsck doesn't report if compression has been enabled.
debugfs.reiser4 should be patched to show value of "create" (reg40 or 
ccreg40),
"compress" (lzo1, or gzip1), etc.

Edward.
