From: Sascha Lucas <sascha_lucas@web.de>
Subject: Re: How do i make reiser4 filesystem available via /etc/fstab ?
Date: Sat, 16 Aug 2008 18:06:27 +0200
Message-ID: <200808161806.27962.sascha_lucas@web.de>
References: <14477.202.168.22.19.1218874745.squirrel@webmail.velocity.net.au> <200808161023.08004.volker.armin.hemmann@tu-clausthal.de> <14774.202.168.22.19.1218883478.squirrel@webmail.velocity.net.au>
Reply-To: reiserfs-devel@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <14774.202.168.22.19.1218883478.squirrel@webmail.velocity.net.au>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Am Samstag, 16. August 2008 12:44:38 schrieb doiggl@velocitynet.com.au:
> I tried the following in /etc/fstab, and restarted, no luck,
> /dev/sda  /reiser4 reiser4 0 0

the options column is missing: i.e. "noatime" or just "defaults"

/dev/sda /reiser4 reiser4 noatime 0 0

see MOUNT(8) and FSTAB(5)

Sascha.
