From: =?ISO-8859-1?Q?J=FCrgen_Botz?= <jurgen@botz.org>
Subject: Re: software packaging and ReiserFS v4
Date: Wed, 03 Sep 2003 14:52:04 -0700
Message-ID: <3F566284.40406@botz.org>
References: <20030903165409.GD4714@rahul.net> <3F565A8F.4010209@botz.org> <20030903213742.GA13146@rahul.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15537-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030903213742.GA13146@rahul.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Bennett Todd <bet@rahul.net>
Cc: reiserfs-list@namesys.com

Bennett Todd wrote:
>>>(although the forward mappings within /var/lib/pkg/foo wouldn't
>>>update automagically).
>>
>>They could, with the right plug-in.
>=20
> A plug-in to reach in and edit the forward references in the package
> database misses my vision of "simple";

*sigh*

You do not seem to grasp the power of your own idea.  There is no
need for a separate "package database" with your scheme.  What is
the package database but the contents of your 'pkg' directory?
Your links (/usr/bin/program/pkg -> /pkg/program/...) provide the
inversion.  You only need a plug-in to make this "symbolic link"
something that gets atomically changed at both ends.  This is
nothing special... it is no more special than a regular symbolic
link, whose semantics are also provided by a plug-in in reiser4.

I can only paraphrase Hans: The filesystem *is* the database.

:j

--
J=FCrgen Botz               | While differing widely in the various
jurgen@botz.org           | little bits we know, in our infinite
                           | ignorance we are all equal. -Karl Popper

