From: Soeren Sonnenburg <sonne@first.gmd.de>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Mon, 31 Mar 2003 15:28:54 +0200 (MET DST)
Message-ID: <Pine.GSO.4.21.0303311526040.4325-100000@pille>
References: <20030331144113.A1430@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14372-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030331144113.A1430@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Bernd Schubert <bernd-schubert@web.de>, reiserfs@nn7.de, reiserfs-list@namesys.com



On Mon, 31 Mar 2003, Oleg Drokin wrote:

> > Err, sorry but I have to ask again:
> > This problem needs a patch on the server only - yes ?
> 
> Yes. Well, may be this race is not the cause of the problem you are observing,
> but prerequisites are similar, so we'd better make sure this is different problem.

well I know that these files were accessed simultanously from a number of
clients... so it is very likely that this is the same bug...

> > Then I will at least patch+compile the kernel.
> 
> Thank you.

will install this kernel tuesday night (tomorrow) and run some test too.

we will know wednesday if that was the cause.

Soeren.

