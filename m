From: Oleg Drokin <green@namesys.com>
Subject: Re: Error messages.
Date: Thu, 6 Mar 2003 11:40:45 +0300
Message-ID: <20030306114045.B12355@namesys.com>
References: <7473069171.20030305201818@tnonline.net> <20030306095743.B5417@namesys.com> <170120728875.20030306093238@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13117-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <170120728875.20030306093238@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Mar 06, 2003 at 09:32:38AM +0100, Anders Widman wrote:

> > And for this case I am sure this was a scratchy CD-ROM disk in my CD-ROM drive.
>    Well, have no CD-ROM. :)

/dev/hdg is one of my CD-ROMs ;)

> > Probably same stuff can be get when drive is busy remapping bad sectors?
> > Use smartctl to find out how these messages corellate with remapped bad sectors counts?
>   Very strange. Would mean all of my harddrives would be broken, or on
>   their  way  to  get  broken.  I  do  not  believe that.  Most of the
>   hardware, including the cabling has been replaced and changed.

Well, seems as Wayne have noticed, you have one common part:
Promise controllers. How about using different kind of controller
on one of the boxes and see if it helps?

Bye,
    Oleg
