From: Piotr Neuman <sikkh@wp.pl>
Subject: Re: Recursive modified-timestamp?
Date: Sat, 1 Jan 2005 13:28:13 +0100
Message-ID: <200501011328.13093.sikkh@wp.pl>
References: <1909372133-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23017-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1909372133-BeMail@cr593174-a>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Dnia sobota 01 stycze=F1 2005 04:12, Alexander G. M. Smith napisa=B3:
> Fred Schaettgen wrote on Sat, 1 Jan 2005 01:43:48 +0100:
> > The file system itself could help for instance by providing a new
> > "change-monitor"-flag for a file. This flag would be set only from
> > userspace and reset when the file is modified. If the flag is still set
> > when the file is being modified, the filesystem would then create a
> > symlink or something like for the file in a special directory.
>
> That reminds me that the other thing BeOS had was a change notification
> system using messaging.  If you requested monitoring of a directory or
> file (with flags to say which kind of changes are of interest) then
> it would send your program a BMessage with the details (such as a file
> being added to a directory).

Linux has both inotify and dnotify. I really love the kind of threads where=
=20
nobody cares to do the research into existing solutions /approaches and=20
everybody are talking about their ideas (which is of course easier than=20
searching on google).

ps. and yup the GNOME folks are busy coding for inotify instead of imaginin=
g=20
"something that may or may not exist". Just becose you send stuff to=20
technical mailing list, doesn't mean you have a clue...
