From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files
 according to semantic.
Date: Tue, 16 Mar 2004 18:52:49 -0500 EST
Message-ID: <81559398135-BeMail@cr593174-a>
References: <20040316224523.39093.qmail@web60408.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17256-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040316224523.39093.qmail@web60408.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: faraz ahmed <faraz_irulz@yahoo.com>
Cc: reiserfs-list@namesys.com

faraz ahmed wrote on Tue, 16 Mar 2004 14:45:23 -0800 (PST):
> Each Directory Structure is a XML file
> discribing the directory structure as well as the
> attributes of the Files to be listed under Each
> directory. The file system the mounts this XML file &
> produces the directory listing by querying the FS for
> files which match the criteria. The Project will soon
> be made public under GPL. Following is the abstract.
> Please guide me with your valuable suggestions.

We had a long discussion a few months ago (August to December 2003)
about similar techniques using variations of hard links to accomplish
a similar thing (putting a file in several different places).  Plus
the same discussion also involved attributes.  Have a look at the Reiser
archives (some awkward mailing list commands required), messages with
"Attributes" or "Hardlinks" or "Hard links" in the subject are relevant.

Microsoft is also doing something along those lines for their WinFS, a short
description is at http://www.tomshardware.com/storage/20040129/index.html

And if you want to see it in action, live queries and all, have a look at
BeOS, free version at http://www.bebits.com/app/2680 and read the BeOS Bible
book http://www.birdhouse.org/beos/bible/ to get a feel of how it is
actually used (I guess the Queries chapter would be most relevant).

- Alex
