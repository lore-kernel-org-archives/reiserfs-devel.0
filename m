From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: Reiser4. BEST FILESYSTEM EVER? I need help.
Date: Thu, 05 Apr 2007 17:23:23 -0700
Message-ID: <461592FB.5060507@zytor.com>
References: <46157B5B.5000602@gmail.com> <1175817921.18400.1183285196@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1767449AbXDFAXm@vger.kernel.org>
In-Reply-To: <1175817921.18400.1183285196@webmail.messagingengine.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: johnrobertbanks@fastmail.fm
Cc: Ignatich <ignatich@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

johnrobertbanks@fastmail.fm wrote:
> 
> Anyway, I have patched the 2.6.20 kernel and have a partition formatted
> with Reiser4.
> 
> However, I am having trouble getting LILO or GRUB working (with
> Reiser4).
> 
> Could you guys who know all about this, help me, or point me to some
> help.
> 

Make your /boot a separate partition and format it as conservatively as 
possible (e.g. ext3, or even ext2.)

Problem solved.

	-hpa
