From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far
Date: Mon, 22 Sep 2003 18:50:24 -0400 EDT
Message-ID: <1971720372-BeMail@cr593174-a>
References: <1064237310.3f6ef8fe4ba0e@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15722-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1064237310.3f6ef8fe4ba0e@webmail.st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

lrc1@st-andrews.ac.uk wrote on Mon, 22 Sep 2003 14:28:30 +0100:
> I'm back to play Banquo's ghost. This talk about syntax is all very well, but
> does anyone have answers for questions like the following:
> 
> * Will
> 
> 	chmod u-rwx somefile; chmod u+rwx somefile
> 
> still work? What special-case behaviour will be needed to make it work?

Likely via the Janus (two faced) view of the file system as ordinary files and directories for old software.  Ideally new versions of ls, chmod (or a completely new permission system), etc, would be needed for native use.

> * Will it be possible to make a attribute file the child of
> /pub/some_ordinary_directory via a hard link? Will it be possible to make an
> attribute file into an attribute file for some other file? That has completely
> different permissions? And is owned by a different user? What will have to
> happen, in either case, at the time the file is hard-linked to its new parent?

Attributes are files (actually what I call fildirute Things - file directory and attribute all at once) like any other Thing.  So presumably the same hard linking and permission rights apply to them as you already have for conventional files (the permission is part of the fildirute Thing, perhaps via a plug-in).  Isn't Hans Reiser doing some research explicitly on access security?

- Alex
