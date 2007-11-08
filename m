From: "Dushan Tcholich" <dusanc@gmail.com>
Subject: Re: [BUG] reiser4-for-2.6.22-2 Large stalls when using atime mount option
Date: Thu, 8 Nov 2007 09:52:13 +0100
Message-ID: <a08621850711080052x6063a538n7d3bc87eef3c01df@mail.gmail.com>
References: <a08621850711071223w30e5f74bua8e8189efb6814a7@mail.gmail.com>
	 <5c7c368b0711071331q496ba3b5yf2383f2a0578b3e8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=EDXlYnk+pWvHCZYV1w8uDe5/A0RnmS33rR18CdmRP4Y=;
        b=bCDWjx84RLew3fFGl4VGQEBhMDKKDcJyduSME2qVzHronz0hgSpQKZsagxXDQ4gMUNZoLl6n7LBY2mIjbj0dXxp/g/3yLRsAKt4QsMEkLbxf2uYqDd/eehMR9m4PQ3h674yjNHpyxxf/H5+2W5EV4Ngha7LV4gqhoLocoX69pW0=
In-Reply-To: <5c7c368b0711071331q496ba3b5yf2383f2a0578b3e8@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hi

On Nov 7, 2007 10:31 PM, Edward Shishkin <edward.shishkin@gmail.com> wrote:
> Hello.
>
> On 11/7/07, Dushan Tcholich <dusanc@gmail.com> wrote:
> > Kernel: Gentoo 2.6.22-r2 + reiser4-for-2.6.22-2.patch
> > fstab:
> > /dev/sda2        /boot        ext2        noauto,noatime    1 2
> > /dev/sda5        /        reiser4                0 0
> > /dev/sda3        none        swap        sw        0 0
> > /dev/sda6        /home        ext3        noatime        0 0
> >
> > reiser4 partition is with cryptocompress (lzo) default settings.
> >
> > I usually mount r4 with -noatime, but after some debbuging with some users
> > on irc (rvalles), who have intermitent large stalls, we found that only
> > difference between our setups was my -noatime flag in fstab.
>
> Plus rvalles doesn't use compression (isn't it?)

He had stalls without compression, but now switched to compression and
still has them.
But I can't reproduce them with -noatime option.
>
> > I tried to mount / without -noatime, started gnome, and then in about same
> > time evolution, firefox, played some mp3s, avis, did a kernel compile,
> > emerge -uD world (compiled few packages), acessed some random fles in
> > /usr/src/linux, started gnome disk usage analyser etc. and had no stalls at
> > all.
> > And then I tried to reboot. System stalled for 3min 25 sec (i was ready with
> > a watch :)) before printing the first message, with heavy disk activity.
> > Upon reboot I just changed line in fstab with nano to mount r4 with -noatime
> > and rebooted agin. Now there were no stalls.
> >

To my inexperienced eyes it looks like lazy writes of atime are adding
with that "reiser4 writes continuously to same sector" bug.

>
> Currently I am preparing a patch for this problem.
> Not sure about its efficiency: we'll take a look..

Great

>
> Thanks,
> Edward.
>

Dushan
