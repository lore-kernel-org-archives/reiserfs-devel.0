From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [BUG 4.5.3.patch] kernel BUG at fs/reiser4/plugin/file/file.c:820
Date: Thu, 11 Aug 2016 11:17:17 +0200
Message-ID: <a103c9d7-fa39-7572-09e6-acbd38741368@gmail.com>
References: <CADW=+3kQ+CrNqGYZ+EEHqj+rV_qQvE-_cE7XzYGJJ3Fgo30GUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=p1isDmS//UNT4BdoG3rfb0axfzpW6DgBWGQZIFGk5O8=;
        b=RGs0i+gQDwpvxBZ9eCxWdfiZGsmDbo9j4OjHl+I0woYhuUnULT91YdSLgHceqUfZ/T
         a+OQ87ynK+DQeDStNmvxASPaKE/tOWLMoq0zYH5xvkPwnCcNnoeTwF4JDdXhlR2v539W
         oILmuSD5ltuTw3WTbtdztnzqI5sTxW0k6cbg8LJfEhGapiY6o1+zN1dlJgt8B/v0qTPk
         kDQJbbR5Shb53oJzCYtCsld43KZhF9elBz2YNikTWZv1ozrKntRTKXx95xyG1VnFtuD5
         nOiLj35cZmtmswoCp6qc15+twVFaSNk7wUQkgtWqj5eRZeppknsEu1cF/hVMGdWL+5e8
         ++4w==
In-Reply-To: <CADW=+3kQ+CrNqGYZ+EEHqj+rV_qQvE-_cE7XzYGJJ3Fgo30GUQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Interesting...
What is your CONFIG_REISER4_DEBUG status?

Thanks!
Edward.

On 08/11/2016 10:51 AM, Dušan Čolić wrote:
> With reiser4-for-4.5.3.patch I got kernel BUG at
> fs/reiser4/plugin/file/file.c:820
>
> System froze and there was nothing in logs after restart but I made a
> photo of log (attached).
>
> krshina3 dusan # cat /etc/fstab | grep -v '#'
> /dev/sda1               /boot           ext2            noauto,noatime  1 2
> /dev/md123              none            swap            sw              0 0
> /dev/sda2               /               reiser4
> noatime,onerror=remount-ro              0 0
> /dev/md125              /mnt/backup     reiser4
> noatime,noauto,onerror=remount-ro       0 0
> /dev/md126              /mnt/media      reiser4
> noatime,users,onerror=remount-ro        0 0
> /dev/md127              /usr/portage    reiser4
> noatime,onerror=remount-ro              0 0
> /dev/dvdrom             /mnt/cdrom      auto            noauto,ro       0 0
>
> shm                     /dev/shm        tmpfs
> nodev,nosuid,noexec     0 0
>
> All reiser4 partitions are ccreg40.
>
> Thanks
>
> Dushan

