From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: More on Hard Links
Date: Tue, 9 Dec 2003 19:13:27 -0500 (EST)
Message-ID: <20031210001327.54822.qmail@web25005.mail.ukl.yahoo.com>
References: <20031209234740.27534.qmail@web25010.mail.ukl.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16309-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031209234740.27534.qmail@web25010.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>, reiserfs-list@namesys.com

Had a few more thoughts...

Narcoleptic Electron wrote: 

> This is a far better solution, because there is no
> need to worry about global uniqueness of volume IDs
> or file ID reuse within volumes.

A revision: note that global uniqueness of volume IDs
is still ideal.  Does ReiserFS provide globally unique
IDs for its volumes?

Hubert Chan wrote:

> I'm not completely satisfied with the condition 
> that you can't write to a file if the involved 
> volumes are not mounted.

Think of the non-writable, offline file as a "cached"
version of the file, and you can make a copy for
modification if you wish.  I don't see a usability
issue here.


______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
