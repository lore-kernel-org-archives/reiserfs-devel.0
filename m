From: Oleg Drokin <green@namesys.com>
Subject: Re: access beyond end of device again
Date: Tue, 25 Jun 2002 11:55:05 +0400
Message-ID: <20020625115505.A2937@namesys.com>
References: <Pine.LNX.4.44.0206250044360.28871-100000@avon.timetraveller.org> <661330051733.20020624103045@redefine.org> <20020625095409.A6209@namesys.com> <1141375583133.20020626230935@redefine.org> <20020625101503.A878@namesys.com> <0819468.20020627004746@redefine.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10831-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <0819468.20020627004746@redefine.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin <coggy@redefine.org>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jun 27, 2002 at 12:47:46AM -0700, Kevin wrote:
> > --fix-fixable can fix such errors. (it just zeroes offending pointers),
> > It would be nice if you first run reiserfsck --check and show us the output,
> > though. Because you may have other kinds corruptions as well.
> I put the log here as its somewhat long:
> http://redefine.org/~coggy/hdi.txt

Well, you have some corrupted leaves in conjunction to corrupted unformatted
pointers. So reiserfsck --rebuild-tree seems to be needed.
Are you sure there is no data corruption when writing to disk?
There were reports that VIA chipsets have problems with more than 3 IDE
channels being in use simultaneously.
I am sure there is even a test suite that trigger these bugs reliable.
(you have not told us anything about your motherboard/system so may
be you do not use VIA chipset of course, but finding one of such tools
that uses several HDDs simultaneously is advisable).

Bye,
    Oleg
