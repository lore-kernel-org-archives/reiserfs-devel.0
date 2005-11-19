From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: File as a directory - file-as-dir vs. link-dirs (again) - 3/3
Date: Sat, 19 Nov 2005 14:58:56 -0500 EST
Message-ID: <11589152124-BeMail@AlexDualP3>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27028-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Leo Comerford <lrc1@st-andrews.ac.uk>
Cc: reiserfs-list@namesys.com

Leo Comerford wrote on Fri, 18 Nov 2005 03:42:50 +0000:
> [^.*$]

Just a few points I thought of while reading through your text:

Genealogy is an extremely structured arrangement of data, most people won't be
doing something that complex - think of photo filing instead.  Also cycles
exist everywhere, even in genealogy.  So cycles should be supported by default.

You had a separate directory storing relationship links.  How about making that
a subdirectory of the person?  If I wanted to do genealogy-as-a-file-system, I'd
have a "children" subdirectory under the person; it would contain hard links to
all the person's children.  If you want to find a person's mother or father,
examine the list of their parent directories (a cyclic file system has more
parents than just "..") to find the ones called "children".  The person's
parents are the holders of those "children" directories.

I wouldn't worry about naming conflicts (such as "children" being a magic name)
since most people only define a few dozen relationships, at least in BeOS.  E-mail
was the most complex, followed by MP3 audio and photo tagging and not too much
else.  So just stick a prefix on the Children directory to mark it as special,
or mark it with a special file type (a subclass of directory in Apple's new
typing scheme).  BeOS used a short prefix, like "MAIL:" so you'd have
"MAIL:subject" and "MAIL:from" as e-mail attribute names (though that's actually
bad, since news articles have subjects too).

Admittedly one difficulty is in representing tuples.  And double ended links.
Like the Friendship relation.  BeOS handled that by tagging things with group
names, and then indexing the tags.  So e-mail contacts all had a "META:group"
attribute containing a comma separated list of group names.  The BeOS indexed
attribute query engine could then quickly turn up all contacts belonging to a
particular group.  Though finding a list of all groups wasn't as elegant.
Which reminds me that attribute-like things should include arrays, with global
indexing support to find things inside an array (also useful for arrays of
keywords in word processing documents).

So to sum up, it seems that you're way more power hungry than I.  I just want
something to make finding photos easier, not a whole database equivalent system
(I'd use a database for that).  Early versions of BeOS did use a database as
the file system, which turned out to be more trouble than it was worth.  A file
system can and perhaps should be something lighter.  But not as lightweight as
plain Unix file systems - I want better searching and linking.

- Alex
