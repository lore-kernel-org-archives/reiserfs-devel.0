From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far
Date: Thu, 18 Sep 2003 22:52:08 -0400 EDT
Message-ID: <1113133468-BeMail@cr593174-a>
References: <20030919014548.10229.qmail@web60006.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030919014548.10229.qmail@web60006.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Narcoleptic Electron wrote on Thu, 18 Sep 2003 21:45:48 -0400 (EDT):
> Or we could call the attribute directory "@" (XML schemas use this to signify attributes)... however, it could be misconstrued as "at".
>  
> "^" looks nice too.  It sort of points up toward the containing object, implying a relationship.
>  
> It's probably not too important what we call the attribute directory at this point ... is it?

Slightly important.  For my RAM file system project, I'm working on an archive format that will store everything (files, directories, links, attributes, indices, volume info, metadata).  Kind of like tar :-)  Needed so that the RAM disk contents can be optionally saved when it is unmounted.  Coincidentally the utilities can work with other file systems.  At the moment I have attributes named directly as children of files.  For future compatibility, it would be nice to use whatever the attribute directory name is.  And standard attribute names for userid and other things.  Never mind, getting a standard for that won't happen quickly so I'll just make up my own for now and change it later.

Hans is right, two commas is easier to type.  It's also more obvious to the eye than a single comma.

- Alex
