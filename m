From: Timothy Webster <tdwebste2@yahoo.com>
Subject: Viewing files as directories
Date: Tue, 25 Jul 2006 06:35:22 -0700 (PDT)
Message-ID: <20060725133522.68964.qmail@web51314.mail.yahoo.com>
References: <44C5D5E4.2010209@namesys.com>
Reply-To: tdwebste2@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29193-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C5D5E4.2010209@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

WARNING, a users point of view ;)
Everything is a file, including a directory.

Being able to view files as directories is not just a
nice to have thing. It is actually required if we are
going to manage changesets of odf files.

Changesets are wonderfultool we have as developers to
assist as a community to develop huge complex code.
The truth is most people aren't code developers, but
document developers. odf files are a container. And it
is handy for users to see them as just a single file.
But just about just about every program or script
would be better off seening the odf as a compressed
directory.

Yes it would be really wonderful, if we could just see
directories as file and files as directories. Which of
course means a file and a directory are one in the
same.

As things stand now the way forward seams to be per
application program mime types. Simple right, but it
is not because, applications tools like svn, brz,
darcs, etc. Can't understand that directory checked is
just a odf file. For the basic rule of a file is a
directory and a directory is a file to be true.
Directories need to have mime types too. 

===========================
My question
===========================
How should directory mime types be recorded?
What is the standard?


-Tim.




__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
