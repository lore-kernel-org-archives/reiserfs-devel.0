From: Redeeman <redeeman@metanurb.dk>
Subject: Re: 2.6.18-rc3 - ReiserFS - warning: vs-8115: get_num_ver: not
	directory or indirect item
Date: Sun, 30 Jul 2006 15:31:46 +0200
Message-ID: <1154266306.13635.28.camel@localhost>
References: <9a8748490607300608v65ce3bdcsbb47273bb82a2d6c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750854AbWG3Nb5@vger.kernel.org>
In-Reply-To: <9a8748490607300608v65ce3bdcsbb47273bb82a2d6c@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jesper Juhl <jesper.juhl@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Sun, 2006-07-30 at 15:08 +0200, Jesper Juhl wrote:
> I just got a warning message with 2.6.18-rc3 that I've never seen before :
> 
>   ReiserFS: sda4: warning: vs-8115: get_num_ver: not directory or indirect item
> 
> The message showed up twice in dmesg during two parallel "make -j3"
> builds of the 2.6.18-rc3 kernel source in two sepperate directories.
> I've tried to reproduce it but without luck.
> 
> It would be nice if someone could tell me what the message means and
> wether or not I should be worried about it.
by default i would suggest worried mode.

what does fsck.reiserfs say?
> 
