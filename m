From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Problem with the latest auto snapshot
Date: Mon, 14 Jun 2004 12:21:16 +0300
Message-ID: <20040614092116.GN4990@nysv.org>
References: <200406122131.25974.henning-04@die.informatik.uni-siegen.de> <200406131537.54853.henning-04@die.informatik.uni-siegen.de> <20040613134344.GK4990@nysv.org> <200406141113.16009.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19174-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406141113.16009.henning-04@die.informatik.uni-siegen.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: reiserfs-list@namesys.com

On Mon, Jun 14, 2004 at 11:13:16AM +0200, Henning Westerholt wrote:
>> Could this be because the partition is in use?
>> If it's trafficking data all the time and fsck can't catch up?
>The partition is only temporarily in use, so this should not the case.

I tested this on a 1152-megabyte loopback image, I ran bonnie++ on it
while doing fsck's and I got pretty identical error messages...

>These were the only visible corruption so far. After the mentioned errors, the 
>partition now performs stable. I compile several large oss projects without 
>problems. Fsck shows also no problems.
>Strange. Perhaps the disk format after the mkfs is "unstable", and it needs 
>further use to stabilize it?

I think someone at Namesys, maybe VS or Zam, is better qualified to answer
to this. I'm at a total loss. It doesn't sound reasonable that the file
system must be "driven in" before actual use...

-- 
mjt

