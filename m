From: Chris Humphries <chris@burst.net>
Subject: Re: Reiser4 / Reiserfs bonnie++ performance comparison
Date: Fri, 09 Jul 2004 11:41:11 -0400
Message-ID: <40EEBC97.5090703@burst.net>
References: <20040709165924.27fabe63@philou.gramoulle.local> <200407091724.43326.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19562-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407091724.43326.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

WHOA!

Marcel Hilzinger wrote:
> 
> You mustn't belive in Benchmarks :-). Try it empirically, and you will see, 
> that for big files, Reiser4 is much faster, then ReiserFS was.  Some example
> 
> Deleting a 6,8GB DVD iso image (average of 10 tests):
> ext3			14,15 sec
> reiser3.6	12,67 sec
> reiser4		1,23 sec
> 
> Deleting 3 GB of MP3 files (4MB average file size, 10 tests):
> ext3			11,91 sec
> reiser3.6	4,56 sec
> reiser4		1,86 sec
> 
> Marcel
