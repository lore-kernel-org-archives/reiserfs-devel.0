From: Kevin <coggy@redefine.org>
Subject: Re: access beyond end of device again
Date: Tue, 25 Jun 2002 08:07:29 +0000 (UTC)
Message-ID: <712080311.20020627010847@redefine.org>
References: <Pine.LNX.4.44.0206250044360.28871-100000@avon.timetraveller.org>
 <661330051733.20020624103045@redefine.org> <20020625095409.A6209@namesys.com>
 <1141375583133.20020626230935@redefine.org> <20020625101503.A878@namesys.com>
 <0819468.20020627004746@redefine.org> <20020625115505.A2937@namesys.com>
Reply-To: Kevin <coggy@redefine.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10832-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020625115505.A2937@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


> Well, you have some corrupted leaves in conjunction to corrupted unformatted
> pointers. So reiserfsck --rebuild-tree seems to be needed.
> Are you sure there is no data corruption when writing to disk?
> There were reports that VIA chipsets have problems with more than 3 IDE
> channels being in use simultaneously.
> I am sure there is even a test suite that trigger these bugs reliable.
> (you have not told us anything about your motherboard/system so may
> be you do not use VIA chipset of course, but finding one of such tools
> that uses several HDDs simultaneously is advisable).

> Bye,
>     Oleg

It is a 2x400 celeron on an Abit BP6.  There are 5 hdd's total, spread
across 3 controllers.  All the drives are the master on their channel,
with no slaves.  As far as the testing, do you know of any such tools?
It's worth a try.  However, when the file that triggered the error was
written, the system was not under any stress at all.

