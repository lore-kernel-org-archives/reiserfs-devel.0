From: Oleg Drokin <green@namesys.com>
Subject: Re: Error messages.
Date: Thu, 6 Mar 2003 11:48:21 +0300
Message-ID: <20030306114821.A12426@namesys.com>
References: <7473069171.20030305201818@tnonline.net> <20030306095743.B5417@namesys.com> <170120728875.20030306093238@tnonline.net> <20030306114045.B12355@namesys.com> <76121382843.20030306094332@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13120-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <76121382843.20030306094332@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Mar 06, 2003 at 09:43:32AM +0100, Anders Widman wrote:
> >> > Probably same stuff can be get when drive is busy remapping bad sectors?
> >> > Use smartctl to find out how these messages corellate with remapped bad sectors counts?
> >>   Very strange. Would mean all of my harddrives would be broken, or on
> >>   their  way  to  get  broken.  I  do  not  believe that.  Most of the
> >>   hardware, including the cabling has been replaced and changed.
> > Well, seems as Wayne have noticed, you have one common part:
> > Promise controllers. How about using different kind of controller
> > on one of the boxes and see if it helps?
> Perhaps,  but  the  same  happens on the internal controller. In fact,
> the  internal  controller  (either VIA or the Intel) causes the system
> to freeze when it happens to many times.

Ah, hm. Then I think your best bet is to contact Linux IDE maintainers, I think.

Bye,
    Oleg
