From: Marc-Christian Petersen <m.c.p@gmx.net>
Subject: Re: Horrible ftruncate performance
Date: Fri, 11 Jul 2003 17:34:12 +0200
Message-ID: <200307111730.50601.m.c.p@gmx.net>
References: <20030710052931.GA17957@namesys.com> <200307111716.56823.Dieter.Nuetzel@hamburg.de> <20030711152431.GF17180@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14892-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030711152431.GF17180@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>, Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Szakacsits Szabolcs <szaka@sienet.hu>, reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

On Friday 11 July 2003 17:24, Oleg Drokin wrote:

Hi Oleg,

> Actually I did it already, as data-logging patches can be applied to
> 2.4.22-pre3 (where this truncate patch was included).
> > Maybe it _IS_ time for this _AND_ all the other data-logging patches?
> > 2.4.22-pre5?
> It's Chris turn. I thought it is good idea to test in -ac first, though
> (even taking into account that these patches are part of SuSE's stock
> kernels).
Well, I don't think that testing in -ac is necessary at all in this case.

Hundred (maybe even thousands) of users are using data-logging stuff, SuSE has 
it since years, WOLK has it since years. At least for WOLK I know that there 
isn't at least one problem with data-logging stuff (there might be but not 
hit yet ;) and there are also tons of wolk+reiserfs-data-logging users and I 
can be sure 100%, if there were a problem, my inbox would tell me so ;)

I am using WOLK on many production machines with ReiserFS mostly as Fileserver 
(hundred of gigabytes) and proxy caches.

If someone would ask me: Go for 2.4 mainline inclusion w/o going via -ac! :)

--
ciao, Marc

