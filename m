From: "Xu CanHao" <xucanhao@gmail.com>
Subject: Reiser4: File lost during log rollback.
Date: Mon, 3 Sep 2007 20:07:18 +0800
Message-ID: <6ec7a4340709030507u2cb968eche850f7365011c38@mail.gmail.com>
References: <6ec7a4340708280229l61d86d1dsf113890277bee68e@mail.gmail.com>
	 <alpine.DEB.0.999.0709022011310.7103@sheep.housecafe.de>
	 <6ec7a4340709030319k58b3a1afm994e188cb37170fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=j5aYDyBWAaQmTgfc1H8DZzeIvN3NAJbZgynM2oovhJMms4bOhT4u7tSBgu1EVe+2tFvfjBSZWu7maCiAcqSd5t3rFy627I9fUvmX8mVWHwK3ggdTek8amoq5h5ul00ls6X6pdSjw/WsEOqdBSjk6tTwt+KaGzb6LzULaB1To6d4=
In-Reply-To: <6ec7a4340709030319k58b3a1afm994e188cb37170fe@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello!

1, The system had some power lost recently, I believe the file lost
during one time(I did not write to that file at once).
2, Is there any evidence show that 2.6.22 much more stable(or at least
solved that behavior)?
3, There is no /lost+found directory in a reiser4 partition(AFAIK it's ext2/3).
4, I've no idea _when_ does the file lost, so tracing the logs is not possible.
5, fsck.reiser4 reports no corruption.

Thanks!


2007/9/3, Christian Kujau <lists@nerdbynature.de>:
> On Tue, 28 Aug 2007, Xu CanHao wrote:
> > I've heard someone said reiser4's possibility of losing some file
> > when crash. Well, I have one exactly the same experience: my system is
> > slackware 11.0, and vanilla 2.6.21+patch for 2.6.21+r4tools 1.0.5,
> > after one or two times of power loss, (at least)my /usr/sbin/sendmail
> > lost, and the partition free space have a ~200MB less. Because of
> > /usr/sbin/sendmail is not system critical file, I think the loss could
> > happened some days ago. Any ideas?
>
> Does this happen to your system when it has crashed or are you losing
> files during runtime? Did you try 2.6.22? Checked /lost+found, the system
> logs? Does fsck report something useful?
>
> --
> BOFH excuse #435:
>
> Internet shut down due to maintenance
>
