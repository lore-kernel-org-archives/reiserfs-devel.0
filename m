From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [BUG 4.5.3.patch] kernel BUG at fs/reiser4/plugin/file/file.c:820
Date: Thu, 11 Aug 2016 11:20:33 +0200
Message-ID: <CADW=+3kAbAiks54vP2MrzQhfzpQcsVFvjuUbH_sGdfru0MPzVg@mail.gmail.com>
References: <CADW=+3kQ+CrNqGYZ+EEHqj+rV_qQvE-_cE7XzYGJJ3Fgo30GUQ@mail.gmail.com>
 <a103c9d7-fa39-7572-09e6-acbd38741368@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UMFlnIspiFjJLSiafTRLoy99OP5C49zlOzKklTrvABc=;
        b=Zlo41bFDptnTNWkijQKCKFLtZget4h68xBUy6fpO788KcpcFSo68YS/xdrnLhxHcq3
         qdMAA/L+Utb2WWnxPe5/XJkDHvTm53aY0lfgygcKK5ZXdpon5XAa73pXMTjB7M0P/e+e
         UClgWxuRQYpEPpVN+3tsvV0FdHabUMP0svXAv5p/wuAoTqMV7/Us+sFbv5xdP4yF8K0P
         r6uzKSSMYkrVnR9dd1Meyi+1Pci28mFYuow9Bt5o0mUwq58h7rJHAcTc+K0rd6P3+chm
         /ZMQZ6f8N1ROIJ+WfYacqBvcygHLx5QeTJaMEW4inuD6K1mL9TK6ikI1wWbbBJeFfRRy
         2o7A==
In-Reply-To: <a103c9d7-fa39-7572-09e6-acbd38741368@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Thu, Aug 11, 2016 at 11:17 AM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Interesting...
> What is your CONFIG_REISER4_DEBUG status?
>
krshina3 dusan # zcat /proc/config.gz | grep REISER4_DEBUG
# CONFIG_REISER4_DEBUG is not set



> Thanks!
> Edward.
>
>
> On 08/11/2016 10:51 AM, Dušan Čolić wrote:
>>
>> With reiser4-for-4.5.3.patch I got kernel BUG at
>> fs/reiser4/plugin/file/file.c:820
>>
>> System froze and there was nothing in logs after restart but I made a
>> photo of log (attached).
>>
>> krshina3 dusan # cat /etc/fstab | grep -v '#'
>> /dev/sda1               /boot           ext2            noauto,noatime  1
>> 2
>> /dev/md123              none            swap            sw              0
>> 0
>> /dev/sda2               /               reiser4
>> noatime,onerror=remount-ro              0 0
>> /dev/md125              /mnt/backup     reiser4
>> noatime,noauto,onerror=remount-ro       0 0
>> /dev/md126              /mnt/media      reiser4
>> noatime,users,onerror=remount-ro        0 0
>> /dev/md127              /usr/portage    reiser4
>> noatime,onerror=remount-ro              0 0
>> /dev/dvdrom             /mnt/cdrom      auto            noauto,ro       0
>> 0
>>
>> shm                     /dev/shm        tmpfs
>> nodev,nosuid,noexec     0 0
>>
>> All reiser4 partitions are ccreg40.
>>
>> Thanks
>>
>> Dushan
>
>
