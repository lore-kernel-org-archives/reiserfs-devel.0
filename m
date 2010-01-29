From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Slow file attribute modification
Date: Fri, 29 Jan 2010 02:52:30 +0100
Message-ID: <5c7c368b1001281752p57d9666bxc00124a80649cdc8@mail.gmail.com>
References: <a08621851001281002u309b11a7nfbfd166e108e154e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=PpUm+sDQkVV0LREnbcR6IO7zTvHPeXJHBoK6AembVAo=;
        b=ReNc58CEtgTvCJ39EjyJlsBe9PP5CIsZgo0kv7zRjgGvVtG/wPrHQP/vETaGDMcr+C
         0IyCHhtOZ/SQLcvWKMY+6MY7ULxtM7HYGXW5RI8a7DPyYhSiNeh9j16IZTvtoTwjVCZG
         pcgDyrVC3TFweHIFFGnsfnYJSjz0m58KRwmbQ=
In-Reply-To: <a08621851001281002u309b11a7nfbfd166e108e154e@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dushan Tcholich <dusanc@gmail.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On Thu, Jan 28, 2010 at 7:02 PM, Dushan Tcholich <dusanc@gmail.com> wrote:
> Hello
>
> When discussing R4 (
> http://forums.gentoo.org/viewtopic-p-6151767.html#6151767 )some users
> mentioned slow fsync and this way to reproduce:
>
> Get a directory full of directories and small files by extracting
> portage to test dir
> http://mirror.bih.net.ba/gentoo/snapshots/portage-20100127.tar.bz2
>
> ls -R /mnt/media/test/ | wc -l
> 177073
>
> Do a:
>  time chown -R portage:portage /mnt/media/test/
>
> Then :
>  time sync
>
> real    40m9.350s
> user    0m0.000s
> sys     0m4.884s
>
> Throughput was around 80kb/s on a WD50000AAKS, no cryptocompress,
> mounted with noatime, kernel 2.6.30
>
> Is this normal,

Do you have a spare partition on your drive?
If yes, then try to write its random blocks and
take a look at the throughput: it should be the
same.

> and why people tell me that ext4 and btrfs do this in
> "several seconds"
> Does the modification hits the platter for them

If they pack inode items together in sequential blocks,
then why not? However in this case those file systems
will be slower on other tests.
