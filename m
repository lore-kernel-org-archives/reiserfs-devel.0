From: Hans Reiser <reiser@namesys.com>
Subject: Re: Repacker and compression plugin
Date: Mon, 27 Mar 2006 10:54:31 -0800
Message-ID: <442834E7.8070104@namesys.com>
References: <BAY23-F11F5DCA23F3B7D6A5BD05F94DF0@phx.gbl>	 <194f62550603260931s21d2022fk@mail.gmail.com> <e50d039c0603261632m2021453bg33ba2e8fb98090d6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28358-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e50d039c0603261632m2021453bg33ba2e8fb98090d6@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Robert Hulme <rob@robhulme.com>
Cc: reiserfs-list@namesys.com

Robert Hulme wrote:

>Any of the Reiser devs have an answer to my questions? :-)
>
>--
>------------------------------------------------------
>"011 8 99988 199 9119 725...3"
>"But those enemies of mine who did not want me to be king over
>them=97bring them here and kill them in front of me." - Jesus (Luke
>19:27)
>"Religion is an insult to human dignity. With or without it you would
>have good people doing good things and evil people doing evil things.
>But for good people to do evil things, that takes religion" - Steven
>Weinberg
>
>http://www.robhulme.com/
>http://robhu.livejournal.com/
>
>
> =20
>
Stability is reasonable, but we are sending in a batch of stuff soon
(maybe this week) that will improve CPU performance and maybe tomorrow
vs will tell us if there are stability improvements in there also, I
forget.  We fixed some cases where if you use up all memory it would
hang, that I remember.

Hans
