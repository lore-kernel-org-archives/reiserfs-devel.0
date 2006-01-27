From: Antonio <tritemio@gmail.com>
Subject: Re: reiserfs corruption
Date: Fri, 27 Jan 2006 15:17:15 +0100
Message-ID: <5486cca80601270617i5080243cg@mail.gmail.com>
References: <5486cca80601260249n6bb98418v@mail.gmail.com>
	 <1138282968.6313.113.camel@tribesman.namesys.com>
	 <5486cca80601260658o33bdc9f3n@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27899-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5486cca80601260658o33bdc9f3n@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

2006/1/26, Antonio <tritemio@gmail.com>:
> Hi,
>
> 2006/1/26, Vladimir V. Saveliev <vs@namesys.com>:
[cut]
> > Would you, please, downgrade to 2.6.14 (or whatever kernel you used
> > before 2.6.15.1) and see whether the problem comes up.
>
> Yes. I'm yet running the standard debian etch kernel 2.6.12. No
> problem so far (~ 1 hour), but it's too early too say if this resolved
> the problem. Even with the 2.6.15.1 kernel the system worked for days
> before having problems.
>
> I'll update you the situation as far as I get an error or otherwise tomor=
row.

So far no error with the older kernel. I strongly suspect my issues
are related to the 2.6.15.1 (vanilla) kernel. My HD seems really
(fingers crossed) sane. Even uder eavy load I've haven't no error in
other non reiaserfs partitions.

I saw this (probably) analoge thread on LKML:

  http://lkml.org/lkml/2006/1/27/115

Do you think have I to report my problems on LKML too?

Is there anything I can do to help testing?

Best Regards,

  ~ Antonio
