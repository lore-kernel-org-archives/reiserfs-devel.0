From: Chris Mason <mason@suse.com>
Subject: Re: CPU usage problem with custom 2.6.7 kernel
Date: Mon, 16 Aug 2004 09:48:56 -0400
Message-ID: <1092664136.12138.64.camel@watt.suse.com>
References: <411DE847.3070809@iinet.net.au>
	 <1677610534.20040814123650@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20329-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1677610534.20040814123650@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

On Sat, 2004-08-14 at 06:36, Spam wrote:
> > 
> You need to enable DMA and 32bit I/O!
> Use: hdparm -d1c3 /dev/hda
> 

DMA is the major problem there.  hdparm -d1 /dev/hda should be enough to
fix the performance problems.  The rest of the hints given in the
message are just tuning on top of dma, I'd suggest reading the hdparm
manpage carefully before changing any of them.

-chris


