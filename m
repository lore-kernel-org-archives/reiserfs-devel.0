From: Chris Mason <mason@suse.com>
Subject: Re: FW: reiser4 plugin for maildir
Date: Wed, 03 Dec 2003 15:28:48 -0500
Message-ID: <1070483327.27597.121.camel@tiny.suse.com>
References: <3DF9165145FACB4C96977FF650C1E90409633541@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16219-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF9165145FACB4C96977FF650C1E90409633541@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Burnes, James" <james.burnes@gwl.com>
Cc: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

[reiser4 plugins to make mail delivery faster]

There are a few basic things that slow down mail servers when they talk
to filesystems:

1) multiple threads delivering to the same directory contend for the
directory semaphore for creating new files

2) atomic creation of an entire file

3) high load leads to numerous small synchronous filesystem operations
when multiple threads all try to deliver at once.

#1 is best fixed at the VFS level, basically allowing more fine grained
directory locks (lustre needs this as well I think).  It could be dealt
with entirely inside reiser4, but this is a generic need for linux as a
whole I think.

#2 and #3 could be dealt with in a reiser4 transaction subsystem. 
Basically the mail server would deliver a number of messages and trigger
commits at regular intervals, and reiser4 would make sure the files were
created atomically in the FS.  The mail server would not report the file
as delivered to the smtp client until the commit had completed.

So, I definitely think you could use reiser4 to gain significant mail
delivery performance.  But you probably don't need  a specific plugin
outside the transaction subsystems.  The obvious benefit of only using
the transaction systems is that you won't need to teach mail clients
about the reiser4 plugin.

There's lots of other plugin topics related to teaching the FS about
various file formats.  This may or may not be a good idea in some cases,
but it is a good place for research.  I'd start by looking at the xattr
interfaces and Hans' ideas for FS-as-a-database.

-chris


