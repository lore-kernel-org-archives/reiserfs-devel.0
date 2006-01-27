From: =?ISO-8859-1?Q?St=E9phane_Jourdois?= <kwisatz@rubis.org>
Subject: Re: dump in reiserfs
Date: Fri, 27 Jan 2006 16:36:00 +0100
Message-ID: <43DA3DE0.1050204@rubis.org>
References: <43D9FB3E.9030309@Westminster.ac.uk> <1138363595.6238.49.camel@tribesman.namesys.com> <43DA2BA9.8040100@Westminster.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27903-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43DA2BA9.8040100@Westminster.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Sujit Choudhury a =E9crit :

> Thanks Vladimir.  Is there anything that we can use so that we dump
> the filesystem and use pipe to restore it from the input?
> By dump (I mean a replacement dump command).

Something like tar cp /your_fs | tar xvp -C /your_restore_point ?

--=20
 ///  Stephane Jourdois     /"\  ASCII RIBBON CAMPAIGN \\\
(((    Consultant securite  \ /    AGAINST HTML MAIL    )))
 \\\   24 rue Cauchy         X                         ///
  \\\  75015  Paris         / \    +33 6 8643 3085    ///

