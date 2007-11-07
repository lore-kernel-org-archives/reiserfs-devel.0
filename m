From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: [BUG] reiser4-for-2.6.22-2 Large stalls when using atime mount option
Date: Thu, 8 Nov 2007 00:31:58 +0300
Message-ID: <5c7c368b0711071331q496ba3b5yf2383f2a0578b3e8@mail.gmail.com>
References: <a08621850711071223w30e5f74bua8e8189efb6814a7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=CxX1wpIuuGaRa2Wym5MORU+GZibG3nt52uK0TIcUECo=;
        b=DBk2aS9TG4XM86+Ck/k2FElVsBiA4Hx2EtIl3+PSxwUmyikP9fcj/TKEuWGy5+NTKU9dyxkW8kzjWGiOhYvtenlX06Sshoyz6FOfZpNMSkn+7lAkkRoIA/rG8UqCRD31lNqVDPMpiia+WUQ5ZCrs8/1C8264P6ZaoJHB3WLBqts=
In-Reply-To: <a08621850711071223w30e5f74bua8e8189efb6814a7@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Hello.

On 11/7/07, Dushan Tcholich <dusanc@gmail.com> wrote:
> Kernel: Gentoo 2.6.22-r2 + reiser4-for-2.6.22-2.patch
> fstab:
> /dev/sda2        /boot        ext2        noauto,noatime    1 2
> /dev/sda5        /        reiser4                0 0
> /dev/sda3        none        swap        sw        0 0
> /dev/sda6        /home        ext3        noatime        0 0
>
> reiser4 partition is with cryptocompress (lzo) default settings.
>
> I usually mount r4 with -noatime, but after some debbuging with some users
> on irc (rvalles), who have intermitent large stalls, we found that only
> difference between our setups was my -noatime flag in fstab.

Plus rvalles doesn't use compression (isn't it?)

> I tried to mount / without -noatime, started gnome, and then in about same
> time evolution, firefox, played some mp3s, avis, did a kernel compile,
> emerge -uD world (compiled few packages), acessed some random fles in
> /usr/src/linux, started gnome disk usage analyser etc. and had no stalls at
> all.
> And then I tried to reboot. System stalled for 3min 25 sec (i was ready with
> a watch :)) before printing the first message, with heavy disk activity.
> Upon reboot I just changed line in fstab with nano to mount r4 with -noatime
> and rebooted agin. Now there were no stalls.
>

Currently I am preparing a patch for this problem.
Not sure about its efficiency: we'll take a look..

Thanks,
Edward.
