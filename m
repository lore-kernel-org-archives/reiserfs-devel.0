From: Jon Smirl <jonsmirl@yahoo.com>
Subject: Re: Some general questions about Reiser4
Date: Tue, 10 Dec 2002 18:02:16 -0800 (PST)
Message-ID: <20021211020216.89861.qmail@web14905.mail.yahoo.com>
References: <3DF69476.7070601@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12146-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF69476.7070601@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

It would be difficult to implement alternative indexes
on the file system if the path is the only key into
the file system. A directory rename in the middle of
the path would ruin a large part of the secondary
index.

I'm with you on SAN vs global. Identifying files by
unique id also has a big advantage in a globally
distributed file system by allowing easy replication. 

One project I have been looking in to is to making a
Goolge like interface to the local file system. In
other words provide a set a query terms to the file
system and get back a list of files that match. To do
this efficiently you need to be able to construct
stable, alternative indices.

I've never been a fan of always looking at my file
system via a single view based on path name.

=====
Jon Smirl
jonsmirl@yahoo.com

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
