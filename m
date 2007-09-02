From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: Reiser4: File lost during log rollback.
Date: Sun, 2 Sep 2007 20:14:14 +0200 (CEST)
Message-ID: <alpine.DEB.0.999.0709022011310.7103@sheep.housecafe.de>
References: <6ec7a4340708280229l61d86d1dsf113890277bee68e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <6ec7a4340708280229l61d86d1dsf113890277bee68e@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xu CanHao <xucanhao@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Tue, 28 Aug 2007, Xu CanHao wrote:
> I've heard someone said reiser4's possibility of losing some file
> when crash. Well, I have one exactly the same experience: my system is
> slackware 11.0, and vanilla 2.6.21+patch for 2.6.21+r4tools 1.0.5,
> after one or two times of power loss, (at least)my /usr/sbin/sendmail
> lost, and the partition free space have a ~200MB less. Because of
> /usr/sbin/sendmail is not system critical file, I think the loss could
> happened some days ago. Any ideas?

Does this happen to your system when it has crashed or are you losing
files during runtime? Did you try 2.6.22? Checked /lost+found, the system 
logs? Does fsck report something useful?

-- 
BOFH excuse #435:

Internet shut down due to maintenance
