From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  reiserfs on redhat advanced server?
Date: Sat, 1 Feb 2003 13:09:06 +0300
Message-ID: <20030201130906.A18602@t-raenon.nmd.msu.ru>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org> <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no> <3E3A6071.6060102@namesys.com> <20030131115333.GC15359@marowsky-bree.de> <20030131150852.A14386@t-raenon.nmd.msu.ru> <3E3A6A27.4060206@namesys.com>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12602-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E3A6A27.4060206@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: flx@msu.ru, Lars Marowsky-Bree <lmb@suse.de>, Ragnar Kj?rstad <reiserfs@ragnark.vestdata.no>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

Fri, Jan 31, 2003 at 03:20:55PM +0300, Hans Reiser wrote:
> You are not a typical sysadmin, you work for an organization with ~10 
> full-time kernel hackers, and the percentage of companies out there who 
> can say that their average computer users are as skilled as any of 
> SuSE's staff is not very high you know....

Some linux-kernel hackers still do some stupid things userland :) sometimes...
Wont go in details.

> 
> Most companies do indeed have a real need for tech support.  If the 
> distros don't support official stable linux kernels, it is a serious 
> social problem for our community, as it will substantially reduce the 
> user base for those kernels in corporate environments.  It is especially 
> a problem if the largest vendor does it.
But thats quite a GOOD point. Its excellent point actually, worth broughting
it in LKML. Its a problem and its a solution. indeed.

All the idea of open-source and linux is that you could take a turn from
"railroad" anywhere you wont, and while its an effort theres ussually a benefits
which are worthy of effort. 

In propietary software if something gone wrong (and its ussually does when you
leaving "railroad") you left to reverce engeneering (effort*10, and DMCA wont like that) or merciless tech.support (merciless people quite often stupid also).

> Hans
> 
> Alexander Lyamin wrote:
> 
> >Fri, Jan 31, 2003 at 12:53:34PM +0100, Lars Marowsky-Bree wrote:
> > 
> >
> >>On 2003-01-31T14:39:29,
> >>  Hans Reiser <reiser@namesys.com> said:
> >>
> >>   
> >>
> >>>If you want a stable kernel for a mission critical server, the only 
> >>>thing that works is to ask around and find out what Marcelo kernel has 
> >>>been known stable for at least 6 weeks.
> >>>     
> >>>
> >>And lose all support from RH or SuSE because you installed a non-supported
> >>kernel image ;-) And thus violate the Oracle cert, the SAP cert (well, if 
> >>RH
> >>had one), etc pp.
> >>
> >>Just something you can't do in some environments.

-- 
"Cache remedies via multi-variable logic shorts will leave you crying."(cl)
Lex Lyamin
