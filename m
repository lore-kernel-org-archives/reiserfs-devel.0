From: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Subject: Re: How do i make reiser4 filesystem available via /etc/fstab ?
Date: Sat, 16 Aug 2008 13:47:15 +0200
Message-ID: <200808161347.15626.volker.armin.hemmann@tu-clausthal.de>
References: <14477.202.168.22.19.1218874745.squirrel@webmail.velocity.net.au> <200808161023.08004.volker.armin.hemmann@tu-clausthal.de> <14774.202.168.22.19.1218883478.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <14774.202.168.22.19.1218883478.squirrel@webmail.velocity.net.au>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Samstag, 16. August 2008, doiggl@velocitynet.com.au wrote:
> Hello,
> I tried the following in /etc/fstab, and restarted, no luck,
> /dev/sda  /reiser4 reiser4 0 0
>
> By the way, this whole disk(separate to the o/s) was intended to be
> reiser4. Glenn

then create one big partition.


