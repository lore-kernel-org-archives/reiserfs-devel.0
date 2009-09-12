From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: GRUB-Reiser4
Date: Sat, 12 Sep 2009 22:35:31 +0200
Message-ID: <4AAC0613.6070203@gmail.com>
References: <111521252678504@webmail40.yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <111521252678504@webmail40.yandex.ru>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Denic Sinisa <sdenic@yandex.ru>
Cc: reiserfs-devel@vger.kernel.org

Denic Sinisa wrote:

Hello.

> I forgot to mention da it has been done
> in SystemRescueCd-x86-1.2.3's rootfs copied on test partition.
> I had wanted to test GRUB on test partition, and thus I set rootfs 
> from SystemRescueCd-x86-1.2.3. which has (surpicely for me) some i486-gcc
> Is there solution to proceed with i486-gcc compiler or I have to change whole rootfs
> in order to compile,install and test grub-0.97-reiser4
>   

Build it and run the grub shell in _any_ system with _any_ rootfs.
Then have a reiser4 partition and try to access its files via "cat"
command. Report about results.

Thanks,
Edward.
