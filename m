From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far
Date: Fri, 19 Sep 2003 09:27:44 -0400 EDT
Message-ID: <39249798517-BeMail@cr593174-a>
References: <1063960955.1978.347.camel@biker.psw.pdb.fsc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15703-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1063960955.1978.347.camel@biker.psw.pdb.fsc.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Martin Wilck wrote on 19 Sep 2003 10:42:35 +0200:
> Hey folks, I know it's not my business, but '...', ,',,', '_', '!', '@',
> '-' ... is this really a serious discussion? What about '"' or even ' '?

No, they cause problems with various shell special characters.  So you'd have to escape them with a preceeding backslash if you used them.  That's awkward (even more than using a shifted letter like "_").

> There is enough cryptic stuff already in our file systems. Are you
> prepared to answer tons of email asking what those cryptic files are
> for, or suspecting crackers at work?

Just explain to them that it's a new operating system and things are different there.  If it's too annoying, we can stick a virtual readme file in all ,, directories explaining what it is.  Maybe one for each language too :-)

> Why don't you just call it '.reiserfs-metadata' or similar? Is it really
> so important how many keystrokes the name takes? Why are you debating
> about localization and, at the same, arguing about the position of
> characters on your (U.S., I suppose) keyboard?

.reiserfs-metadata is English.  And it's also ReiserFS specific, while I want to name attributes in other fildirute style file systems too.  Saving typing effort on teletype keyboards is an ancient Unix tradition.

- Alex

P.S.  How about ".,"?  Makes it hidden to older systems, yet isn't too hard to type.
