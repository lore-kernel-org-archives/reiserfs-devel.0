From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: hard linking in reiserfs 4
Date: Tue, 18 Nov 2003 07:30:56 -0500 EST
Message-ID: <85438639518-BeMail@cr593174-a>
References: <1069105166.3206.3.camel@schlappix.schnulli.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16114-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1069105166.3206.3.camel@schlappix.schnulli.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Heinz-Josef Claes <hjclaes@web.de>
Cc: reiserfs-list@namesys.com

Heinz-Josef Claes wrote on Tue, 18 Nov 2003 07:53:32 +0100:
> This is not possible with reiserfs 3.6.
> Will it be possible with reiserfs 4?
> I'm really interested in this feature - does anybody know an existing
> filesystem supporting hard links to directories? (I know ext2 does not
> support them either.)

It's probably not much use to you, but my RAM file system for BeOS does support hard links to directories.  Of course, this means oddities like doing a connected graph search whenever you delete anything to see if you have isolated part of the name space.  Well, it's not quite hard links; I did a few experiments with them but the desktop GUI got seriously confused when trying to display the same hard linked directory window through two different paths, so now I have it present the hard links as symbolic links which dynamically change.

If you wish, you can read more about the technique at http://web.ncf.ca/au829/BeOS/AGMSLinkExplanation.txt and download the file system (including source code) from http://www.bebits.com/app/3642 (use the backup web site link, the primary is down due to bandwidth exceeded this month).

- Alex
