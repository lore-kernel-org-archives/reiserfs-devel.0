From: Chris Mason <mason@suse.com>
Subject: Re: "no space left" but df -k shows plenty of free space
Date: 19 May 2003 12:10:13 -0400
Message-ID: <1053360613.6209.69.camel@tiny.suse.com>
References: <3EC65671.DA1CB780@gmx.de>  <20030519160208.GA14048@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14164-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030519160208.GA14048@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: D_i_F_i@gmx.de, reiserfs-list@namesys.com

On Mon, 2003-05-19 at 12:02, Oleg Drokin wrote:

> My current idea that it might have the "blocks reserved for use by fsck"
> checked incorrectly.

Sorry for the delay, still digging through the email backlog from last
week.  I don't know of any known bugs here, but I'll check.  Exactly
which kernel rpm do you have installed? 
> 
> Chris: Where can I look at the patches that came with
> SLES7-Distribution's kernel?

Well, it depends ;-)  I'll hunt the rpms down.

-chris


