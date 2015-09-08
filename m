From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Tue, 08 Sep 2015 23:21:25 +0200
Message-ID: <55EF5155.2040701@gmail.com>
References: <55E470E0.2070304@gmail.com> <CAM12Q5Qkx-3ShOJjXd02_4Af0it3wv+39hXDW4sFhBosg=i3SQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=b2taOEyohjM0uF23eOdixX+oGC3vmrPrPGZElD+8adM=;
        b=Xb/UJNcTr0AZrTGkF3dJpoTq5Pf/rNmd3y7pZh5DbboXHN95uTKLEbvYt9GzaaluHZ
         Wim9jKJu6flKwVhz3QkpjCIm6UnYRmFR3q9oGrVDeFefxJGobWNkxStsNbZJCEkfxnZF
         jxz6kaqGc8UaWkil0aCdsw9V3J1nZQ/aWx8qmJUqRVz6MOGOj7GpX5tOZX0lfTokgN57
         ZAiwVEyc64bex37FZO35GbmOaxob4BIRUMsJq+VUj3aSzxrI0PaBru5VDmOlFKEzXaMi
         YGIi/sbl+eckFJU3VDwoNJru61pmP5S/o4tTdGVWo/qSEmD3EiV4N1/CrHg9uAwt7X0M
         cllg==
In-Reply-To: <CAM12Q5Qkx-3ShOJjXd02_4Af0it3wv+39hXDW4sFhBosg=i3SQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jose R R <jose.r.r@metztli.com>
Cc: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>



On 09/08/2015 10:46 PM, Jose R R wrote:
> Niltze, Ed-

Hello

>
>
>
> On Mon, Aug 31, 2015 at 8:21 AM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> Hi all,
>>
>> This is the first release of new software versions of reiser4 kernel
>> module and reiser4prods, which invoke the builtin mechanism of
>> tracking compatibility basing on versions of reiser4 plugin library.
>> More about this can be found here:
>> https://reiser4.wiki.kernel.org/index.php/Reiser4_development_model
>>
>> Reiser4progs of the new software release version number 4.0.1
>> are provided by the package reiser4progs-1.1.0. Please find here:
>> https://sourceforge.net/projects/reiser4/files/reiser4-utils/reiser4progs
>>
>> Reiser4 kernel module of the new software release version number
>> 4.0.1 is provided by the patch reiser4-for-4.1.5. Please find here:
>> https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/
>>
>> At mount time disk format version of your partition's superblock will
>> be upgraded by the kernel, and you will be suggested to complete the
>> upgrade offline by fsck:
>>
>> # dmesg | grep [rR]eiser4
>> Loading Reiser4 (format release: 4.0.1).
>> reiser4: sda5: found disk format 4.0.0.
>> reiser4: sda5: upgrading disk format to 4.0.1.
>> reiser4: sda5: use 'fsck.reiser4 --fix' to complete disk format upgrade.
>>
>> You may ignore this suggestion and continue to work as usual.
>> However, I would suggest to find a time and complete the upgrade.
>>
>> NOTE: after mount in the new kernel you won' t be able to
>> check your partition by reiser4progs-1.0.9 and older versions, so
>> please upgrade your reiser4progs BEFORE. Everyone who relies on
>> liveCDs with reiser4progs-1.0.9, or older versions: be careful!
>>
>> More about reiser4 (meta)data checksums can be found here:
>> https://reiser4.wiki.kernel.org/index.php/Reiser4_checksums
>>
>> Thanks,
>> Edward.
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> I have applied reiser4-for-4.1.5.patch.gz to both pristine
> linux-4.1.5.tar.xz from kernel.org and to 4.1.6 from upstream Debian
> and both kernels fail to (re)boot into the Reiser4 root partition in
> which they were built.
>
> I am using Debian Sid reiser4progs_1.1.0-1_amd64.deb from
> https://packages.debian.org/sid/reiser4progs
>
> In both instances, after GRUB boots from the boot partition into the
> root Reiser4 partition and message after
> fsck.reiser4 /dev/sdaX
> [ 3.979349 ] BUG: unable to handle kernel NULL pointer dereference at
> 0000000000000069


Could you catch the full stack dump at serial console,
or take a pic of this by using camera?

Thanks,
Edward.


> [...]
> (initramfs prompt) will not boot into its Reiser4 partition
>
>  From another partition I have even tried (using
> reiser4progs_1.1.0-1_amd64.deb, too)
> fsck.reiser4 --version
> fsck.reiser4 1.1.0
> Format release: 4.0.1
> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
> fsck.reiser4 --fix /dev/sdaX
> and
> fsck.reiser4  --build-fs /dev/sdaX
>
> which finished fine. Nevertheless upon rebooting into fsck'ed
> partition with the Reiser4 4.0.1 kernel module nothing changes, i.e.,
> I get BUG and kernel boot stops at initramfs prompt.
>
>
> Best Professional Regards.
>

