From: lrc1@st-andrews.ac.uk
Subject: Re: Carrying Attributes too Far
Date: Mon, 22 Sep 2003 14:28:30 +0100
Message-ID: <1064237310.3f6ef8fe4ba0e@webmail.st-andrews.ac.uk>
References: <20030919225110.89276.qmail@web60006.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15719-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030919225110.89276.qmail@web60006.mail.yahoo.com>
Content-Transfer-Encoding: 8bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I'm back to play Banquo's ghost. This talk about syntax is all very well, but
does anyone have answers for questions like the following:

* Will

	chmod u-rwx somefile; chmod u+rwx somefile

still work? What special-case behaviour will be needed to make it work?

* Will it be possible to make a attribute file the child of
/pub/some_ordinary_directory via a hard link? Will it be possible to make an
attribute file into an attribute file for some other file? That has completely
different permissions? And is owned by a different user? What will have to
happen, in either case, at the time the file is hard-linked to its new parent?

* What will prevent a supposedly unprivileged user from chowning a file to any
other user - for example, chowning a setuid binary to root?

Any takers?

Leo Comerford.

-----------------------------------------------------------------
University of St Andrews Webmail: http://webmail.st-andrews.ac.uk
