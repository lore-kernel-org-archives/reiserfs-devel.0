From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Tue, 13 Apr 2004 14:07:32 -0400 (EDT)
Message-ID: <20040413180732.7450.qmail@web25004.mail.ukl.yahoo.com>
References: <c5a0ns$dp7$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17898-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <c5a0ns$dp7$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Beni Cherniavsky <cben@users.sf.net>, reiserfs-list@namesys.com

Beni Cherniavsky wrote: 

> Note that changing the magic name (dynamically or
> even by recompiling) 
> can create a confilict with an *exisiting* file on a
> reiserfs4 partition 
> (the file could have been created when another name
> was magic).  The FS 
> code should be ready to handle it, preferably giving
> some escape route 
> way to access the colliding file (e.g.
> ``foo/my_metas/escape`` could 
> give access to the file known as ``foo/my_metas``
> before you changed the 
> magic name to ``my_metas``).

That is a very good point, and I think your solution
is the right way to get around it.


______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
