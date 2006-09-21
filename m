From: Huub <huubvanniekerk@gmail.com>
Subject: Re: partition cannot be mounted from grub
Date: Thu, 21 Sep 2006 08:16:26 +0200
Message-ID: <eetanq$6ij$1@sea.gmane.org>
References: <eet9jg$463$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29951-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <eet9jg$463$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Huub wrote:
> Hi,
> 
> Using Suse 10.1, I had a spontaneous reboot after which I got a fast 
> running screen full of reiserfs messages. Another (inflicted) reboot and 
> Grub gives error 17, meaning it cannot mount a recognized partition.
> Using the boot-dvd, I selected Rescue, and logged in as root but I have 
> no idea how to proceed trying to save my system.
> Help is appreciated.
> 
> Thanks,
> 
> Huub
> 
> 

Correction: errormessage means:

This error is returned if the partition requested exists, but the 
filesystem type cannot be recognized by GRUB.

I.e. GRUB doesn't recognize it's a ReiserFS partition...

