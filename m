From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: More on Hard Links
Date: Thu, 29 Jan 2004 13:18:28 -0500 (EST)
Message-ID: <20040129181828.87867.qmail@web25005.mail.ukl.yahoo.com>
References: <20040129181534.9650.qmail@web25007.mail.ukl.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16654-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040129181534.9650.qmail@web25007.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

--- Hubert Chan wrote: 

> There's another type of link that I think users may
> want -- something
> like symbolic links, but is resilient to file
> movement -- at least
> within the same filesystem.  That could be
> implemented by storing a
> pointer to some sort of filesystem ID, and an inode
> number.  This is
> what I call firm links, and what I think Leo would
> call a soft link.

And what I would call an "alias"!  They would be
resilient to movement across filesystems as well, even
if the other filesystem becomes unmounted (see my
"cloning" proposal for a possible implementation).



______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
