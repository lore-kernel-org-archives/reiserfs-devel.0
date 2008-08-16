From: Sascha Lucas <sascha_lucas@web.de>
Subject: Re: How do i make reiser4 filesystem available via /etc/fstab ?
Date: Sat, 16 Aug 2008 18:14:26 +0200
Message-ID: <200808161814.26175.sascha_lucas@web.de>
References: <14477.202.168.22.19.1218874745.squirrel@webmail.velocity.net.au> <14774.202.168.22.19.1218883478.squirrel@webmail.velocity.net.au> <200808161347.15626.volker.armin.hemmann@tu-clausthal.de>
Reply-To: reiserfs-devel@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200808161347.15626.volker.armin.hemmann@tu-clausthal.de>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Am Samstag, 16. August 2008 13:47:15 schrieb Volker Armin Hemmann:
> > By the way, this whole disk(separate to the o/s) was intended to be
> > reiser4. Glenn
>
> then create one big partition.

Just want say that this is not necessary. filesystems can use the whole disk 
without partitions. It's a common way to bypass DOS partion limitations. 
Don't know the limit atm, but I remember to do so with >20TB :-).

Sascha.
