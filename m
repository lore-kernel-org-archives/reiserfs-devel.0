From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Re: Some more questions about Reiser4 ;)
Date: Sat, 10 May 2003 20:57:53 +0200
Message-ID: <007601c31726$10853fb0$9900a8c0@xpstation>
References: <001e01c313fd$975e7730$9900a8c0@xpstation> <3EBB9121.5060304@namesys.com> <007201c31709$4f36c5c0$9900a8c0@xpstation> <3EBD2427.4000806@namesys.com> <000201c31721$3aca6c50$9900a8c0@xpstation> <3EBD46C1.9080801@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14061-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> >The reason why I asked this was because I didn't knew that VFS was the
one
> >and only responsible for the path resolving ;)
> >
> That is too strong a statement.  VFS delegates parts of the task to us,
> particularly directory lookup.
But VFS wants the directory reading task to return a list of files with
corresponding inodes numbers. Reiser4, in this case, has to check out the
tree and read the directory entries, but what about resolving a simple file
path : does VFS in this case want the files and subdirectory listings of
every directory the path consists in, or does VFS directly ask Reiser4 to
resolve the whole path ?
What does Reiser4 do to improve the path resolving and directory listing
performance ? Do you implement another cache even if the VFS allready got
one ?

> Elena, can you draw a diagram or somehow document the disk layout for
> reiser4.  We seem to describe the pieces but not the whole.
That would be a great thing ;)


Thank you for all your previous answers ... M. Reiser ;)

Fred

