From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Mon, 29 Mar 2004 13:59:01 -0500 (EST)
Message-ID: <20040329185901.62166.qmail@web25008.mail.ukl.yahoo.com>
References: <40684C3A.3060209@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17575-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40684C3A.3060209@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Filipe Almeida <filipe@rnl.ist.utl.pt>, reiserfs-list@namesys.com, Piotr Neuman <sikkh@wp.pl>

Hans Reiser wrote: 

> Network appliance (.snapshot) and clearcase have
> demonstrated that 
> having a few keywords reserved in the namespace is
> not a problem.

Sure, and having a separate attribute namespace is not
a problem, and treating files and directories as
separate entities is not a problem... many other file
systems do these things successfully!  ;-)

My point is: even if it weren't a problem, it is not
elegant or user friendly.  It introduces an
unnecessary restriction on users (can't name your file
"metas"), and thus reduces usability by definition. 
This would be especially tragic, as ReiserFS is
otherwise such an elegant, brilliant and innovative
system.



______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
