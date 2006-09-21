From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: partition cannot be mounted from grub
Date: Thu, 21 Sep 2006 13:50:57 +0400
Message-ID: <200609211350.58135.vs@namesys.com>
References: <eet9jg$463$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29956-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <eet9jg$463$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Huub <huubvanniekerk@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Thursday 21 September 2006 09:57, Huub wrote:
> Hi,
> 
> Using Suse 10.1, I had a spontaneous reboot after which I got a fast 
> running screen full of reiserfs messages. Another (inflicted) reboot and 
> Grub gives error 17, meaning it cannot mount a recognized partition.
> Using the boot-dvd, I selected Rescue, and logged in as root but I have 
> no idea how to proceed trying to save my system.
> Help is appreciated.
> 

being booted off boot-dvd, please, run reiserfsck for partitions which were formatted as reiserfs and
let us see reiserfsck' output.

> Thanks,
> 
> Huub
> 
> 
> 
