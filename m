From: =?ISO-8859-1?Q?J=FCrgen_Botz?= <jurgen@botz.org>
Subject: Re: secure delete?
Date: Tue, 23 Mar 2004 08:34:05 -0800
Message-ID: <406066FD.4060601@botz.org>
References: <1079691239.5767.7.camel@pear.st-and.ac.uk> <405AD31A.7070304@mweb.co.za> <20040319110748.GA30491@chihiro.cern.ch> <405AD9B5.80102@namesys.com> <405F94DD.80004@botz.org> <405FD7C2.5030605@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17411-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <405FD7C2.5030605@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiser@namesys.com
Cc: KELEMEN Peter <Peter.Kelemen@cern.ch>, reiserfs-list@namesys.com

Hans Reiser wrote:
> Secure delete doesn't work against people who have the necessary=20
> equipment to scan the media and find remnants due to track
 > misalignment.

No attempts at security are ever perfect; but there are "pretty good"
approaches to protecting yourself from various threat-models.  A good
secure delete algorithm (see Peter Gutmann's 1995 paper on the topic
@ <http://www.cs.auckland.ac.nz/~pgut001/pubs/secure_del.html>) is a
reasonable approach to a threat model that is distinctly different from
the threat models that are addressed by encryption.

And yes, it can work pretty well against people with the type of
expensive equipment you describe.

I don't know enough about Reiser4's plug-in architecture yet to know
if a secure delete method can be plugged-in (superficially it doesn't
seem like it can as-is), but one way or another it will be needed.

:j

--=20
J=FCrgen Botz               | While differing widely in the various
jurgen@botz.org           | little bits we know, in our infinite
                           | ignorance we are all equal. -Karl Popper
