From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far
Date: Fri, 19 Sep 2003 11:35:28 -0400 EDT
Message-ID: <46913241180-BeMail@cr593174-a>
References: <1063984392.6518.42.camel@biker.psw.pdb.fsc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15706-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1063984392.6518.42.camel@biker.psw.pdb.fsc.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiser FS Mailing List <reiserfs-list@namesys.com>

Martin Wilck wrote on 19 Sep 2003 17:13:12 +0200:
> Call it .metadata if you wish. I just wanted to say that a reasonable
> English name will be easier to understand than ".," for almost
> everybody.

Normally I'm a fan of long names, so .metadata is good, or .attributes would also work.

> > Saving typing effort on teletype keyboards is an ancient Unix tradition.
> 
> The question is if that tradition is really so important in this
> context. Will that file name be typed more often than, say,
> '.xsession-errors' or '.nautilus-metafile.xml'?

Hmmm.  Hard to say what the usage will be.  If I want the MIME type for a fildirute thing, would I be typing:

cat Thing/.,/MIME   or   cat Thing/.metadata/MIME   or   cat Thing/,,/MIME

Actually, Thing/,,/MIME is the easiest one to type.  /.,/ is annoyingly awkward, since the three keys are adjacent and have to be hit in the right order.  /.metadata/ isn't too bad, though it is mostly left handed, making it a good repetitive stress injury source.  /,,/ just feels good.  You try it!  Mmmmmm, slash comma comma slash.

- Alex
