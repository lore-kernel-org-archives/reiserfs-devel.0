From: Oleg Drokin <green@namesys.com>
Subject: Re: Problems with reiserfs partition after systemcrash -- I need help
Date: Fri, 2 May 2003 12:13:07 +0400
Message-ID: <20030502081307.GA20723@namesys.com>
References: <200305011848.48027.kd.wolfinger@gmx.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13925-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200305011848.48027.kd.wolfinger@gmx.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Klaus Dieter Wolfinger <kd.wolfinger@gmx.de>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, May 01, 2003 at 07:19:44PM +0200, Klaus Dieter Wolfinger wrote:

> after a systemcrash I can't mount a partition (hdb2) with reiserfs.
> pass0 -> interrupts with the message:
> cannot read block 12252
> badblocks -b 4096 /dev/hdb2
> 98
> 99
> ..... long list of numbers
> 
> 23954
> .
> 23966

Well, bad hardware (harddrive)

> Is it possible to retrieve the data on this partition ?

Yes, you can dig the archives for solution or read
http://namesys.com/support.html if you want to get advice directly from us.

Bye,
    Oleg
