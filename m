From: Bryan Henderson <hbryan@us.ibm.com>
Subject: Re: XFS corruption during power-blackout
Date: Thu, 30 Jun 2005 12:30:20 -0400
Message-ID: <OFC7BE2BBA.42F70A93-ON88257030.00595A48-88257030.005A99A3@us.ibm.com>
References: <254889.27725ab660aa106eb6acc07307d71ef1fbd5b6fd366aebef9e2f611750fbcb467e46e8a4.IBX@taniwha.stupidest.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <254889.27725ab660aa106eb6acc07307d71ef1fbd5b6fd366aebef9e2f611750fbcb467e46e8a4.IBX@taniwha.stupidest.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wedgwood <cw@f00f.org>
Cc: Al Boldi <a1426z@gawab.com>, linux-fsdevel@vger.kernel.org, linux-xfs@oss.sgi.com, Steve Lord <lord@xfs.org>, 'Nathan Scott' <nathans@sgi.com>, reiserfs-list@namesys.com

>I don't know if this is true for all drives but NONE of the ones I had
>access to when testing did anything like save the cache --- pretty
>much all data that was inflight got lost.

For another point of reference - were these ATA (personal class) or SCSI 
(commercial class) drives or both?

Is write caching the default on typical SCSI devices?

>Linux does have a concept of
>write barriers but these are presently not implemented for XFS right
>now.  Once they are I assume sync + poweroff will be reliable with
>caching enabled.

But be careful with the 'sync' program/system call.  As defined by POSIX, 
it is not a synchronizing operation.  It's supposed to cause buffered 
writes to get hardened some time soon, not right now.  So in theory, you 
can't pull the plug after typing "sync."  In Linux, the implementation has 
changed a few times in this respect.  In some versions, it at least 
_tries_ to implement "everything that was buffered when sync() started is 
hardened before sync() returns."  In others, it implements "everything 
that was buffered when sync() started is hardened before the next sync() 
returns," and some 'sync' programs do multiple sync()s.  And it's also 
filesystem-type-dependent.  I don't know exactly what the present state 
is.

fsync(), on the other hand, is a true synchronizing operation.

--
Bryan Henderson                     IBM Almaden Research Center
San Jose CA                         Filesystems

