From: Robert Brockway <robert@timetraveller.org>
Subject: Re: access beyond end of device again
Date: Tue, 25 Jun 2002 00:37:02 +1000 (EST)
Message-ID: <Pine.LNX.4.44.0206250034070.28871-100000@avon.timetraveller.org>
References: <1951319530634.20020624073524@redefine.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10815-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1951319530634.20020624073524@redefine.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin <coggy@redefine.org>
Cc: reiserfs-list@namesys.com

On Mon, 24 Jun 2002, Kevin wrote:

> I'm getting these errors again:
>   attempt to access beyond end of device
>   38:01: rw=0, want=2052028788, limit=58633312

What sort of device is this supposed to be? :)  38:01 is either a "Myricom 
PCI Myrinet board" or something "reserved for Linux/AP+" (and I'm assuming 
we're talking about a block device rather than a character device here :)

I could be way off but could you confirm what you think the filesystem is 
on?

Rob
-- Robert Brockway B.Sc. email: robert@timetraveller.org  ICQ: 104781119
   Linux counter project ID #16440 (http://counter.li.org)
   avon: up 16 days, 23:28,  1 user,  load average: 0.00, 0.02, 0.00
   "The earth is but one country and mankind its citizens" -Baha'u'llah

