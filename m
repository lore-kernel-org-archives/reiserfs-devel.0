From: Martin Wilck <Martin.Wilck@Fujitsu-Siemens.com>
Subject: Re: Carrying Attributes too Far
Date: 19 Sep 2003 17:13:12 +0200
Message-ID: <1063984392.6518.42.camel@biker.psw.pdb.fsc.net>
References: <39249798517-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15705-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <39249798517-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiser FS Mailing List <reiserfs-list@namesys.com>

Am Fre, 2003-09-19 um 15.27 schrieb Alexander G. M. Smith:

> > What about '"' or even ' '?
> 
> No, they cause problems with various shell special characters.  
> So you'd have to escape them with a preceeding backslash if you used 
> them. That's awkward (even more than using a shifted letter like "_").

That was a joke. I just wanted to express that I consider the other
suggestions awkward, too.

> .reiserfs-metadata is English.

So what? Whoever understands '.,' or similar can understand English (at
that level) as well.

> And it's also ReiserFS specific

Call it .metadata if you wish. I just wanted to say that a reasonable
English name will be easier to understand than ".," for almost
everybody.

> Saving typing effort on teletype keyboards is an ancient Unix tradition.

The question is if that tradition is really so important in this
context. Will that file name be typed more often than, say,
'.xsession-errors' or '.nautilus-metafile.xml'?

Martin

-- 
Martin Wilck                Phone: +49 5251 8 15113
Fujitsu Siemens Computers   Fax:   +49 5251 8 20409
Heinz-Nixdorf-Ring 1	    mailto:Martin.Wilck@Fujitsu-Siemens.com
D-33106 Paderborn           http://www.fujitsu-siemens.com/primergy





