From: Oleg Drokin <green@namesys.com>
Subject: Re: Problem mounting ReiserFS as root partition
Date: Mon, 16 Jun 2003 13:21:44 +0400
Message-ID: <20030616092144.GB12314@namesys.com>
References: <200306151508.57384.till@tantalo.net> <20030616063609.GA12592@namesys.com> <200306161117.02910.till@tantalo.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14556-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200306161117.02910.till@tantalo.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Till Gerken <till@tantalo.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jun 16, 2003 at 11:16:52AM +0200, Till Gerken wrote:

> kernel (hd0,0)/boot/vmlinuz-2.4.21 root=/dev/hda1,rw hdc=ide-scsi pci=biosirq 
> idebus=66

I suggest you to replace the comma between "root=/dev/hda1" and "rw" with space.
 
Bye,
    Oleg
