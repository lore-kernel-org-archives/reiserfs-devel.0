From: Oliver Korpilla <okorpil@fh-landshut.de>
Subject: Re: Still unable to use ReiserFS on PowerPC [Oops]
Date: Tue, 14 Sep 2004 09:20:38 +0200
Message-ID: <41469BC6.1010104@fh-landshut.de>
References: <878ybjqcwy.fsf@sci.fi> <4146201F.5080808@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21734-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4146201F.5080808@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Paavo Hartikainen <pahartik@sci.fi>, reiserfs-list@namesys.com, Vladimir Saveliev <vs@namesys.com>

Hello,

I guess my problem is similar, though I cannot quite verify that.

I'm having a problem exporting Reiser4 over NFS, and Vladimir thought it 
possible that the problem has been rooted in endianness. He sent me a patch that 
tries to expose the problem, and one of the cases got fired.

Maybe you could both talk - I mean Paavo and Vladimir - coordinate about the 
problem, since I'm not in a position to help you beyond having a workstation and 
embedded PowerPC targets, where I can test things.

With kind regards,
Oliver Korpilla

Jeff Mahoney wrote:
> Paavo Hartikainen wrote:
> | On PowerPC, I have never got ReiserFS working.  It breaks apart when
> | trying to copy contents to ReiserFS from existing Ext3 filesystem.  I
> | tried this about one year ago (PowerPC 603e, latest Linux 2.4 kernel
> | back then), and now again (PowerPC 604e, Linux 2.4.27 kernel) with
> | same results.
> 
> As the original author of the endian safeness patches, this report
> concerns me. This code has been in the kernel for a few years now, and
> is considered quite stable. I've tried reproducing on my iBook, and
> could not. Though, 2.4.27 won't even boot on my dual g4 powermac.
> 
> Do you always get an Oops in the same path?
> - -Jeff
