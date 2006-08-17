From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 nfsroot problem
Date: Thu, 17 Aug 2006 21:36:02 +0400
Message-ID: <200608172136.02795.zam@namesys.com>
References: <200608171835.52188.prakash@punnoor.de> <200608171838.24526.prakash@punnoor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29621-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608171838.24526.prakash@punnoor.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Prakash Punnoor <prakash@punnoor.de>

Hello,

On 17 August 2006 20:38, Prakash Punnoor wrote:
> Am Donnerstag 17 August 2006 18:35 schrieb Prakash Punnoor:
> > Hi,
> >
> > Using the reiser4 patch 3 for 2.6.17 with a 2.6.18-rc4 kernel (I
> > ported the reiser4 patch by hand with help of mm kernel...) I
> > wasn't able to boot a nfsroot client with the "image" residing on a
> > master with reiser4 partition. The same setup works w/o problems
> > once I moved the "image" to an ext3 partition.
>
> Perhaps I should note, that the master is x86_64 and the client x86.
> Do you need more infos to reproduce the problem?

did it work with reiser4 with another kernels, before 2.6.17 ?
does plain nfs mount work, not nfsroot?

-- 
Alex.

