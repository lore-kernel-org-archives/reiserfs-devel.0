From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: SMART Self-Test Reports UNC Errors on Dell Latitude D800 Hitachi Travelstar DK23FB
Date: Thu, 12 Aug 2004 20:28:21 +0200
Sender: Bernd Schubert <Bernd.Schubert@tc.pci.uni-heidelberg.de>
Message-ID: <200408122028.23316.bernd-schubert@web.de>
References: <1092327723.16346.7.camel@turing.optivel.com> <200408121932.08943.bernd-schubert@web.de> <1092332887.22266.4.camel@turing.optivel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20234-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1092332887.22266.4.camel@turing.optivel.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

> The Reallocated Sector Count appears to be 91.  I'm not entirely sure

I'm afraid its even worse, the value is 287, just go and replace this drive=
 as=20
soon as possible.  (My personal definition: everything below 10 is fine,=20
10-30 it gets critical and above 30 I will only save scratch data on it)

> how to interpret thye SMART Attributes with Thresholds table.  What is
> the meaning of the VALUE, WORST, and THRESH columns?  What is your

You can find this somewhere in the net, as far as I know those are harddriv=
e=20
specific values which have no further meaning without exact knowledge about=
=20
your harddrive (please correct me if I'm wrong here).
The last column is interesting for you, it tells you the values in human=20
readable format.

Btw, the temperature of you drive is pretty high, for the new drive I would=
=20
try to get it below 40=B0Celsius. The high temperature might be the reason =
for=20
your drive failure.

> assesment of my hard drive?  I've attached the output of smartctl --all.

As I said above, just replace it.


Cheers,
	Bernd


=2D-=20
Bernd Schubert
Physikalisch Chemisches Institut / Theoretische Chemie
Universit=E4t Heidelberg
INF 229
69120 Heidelberg
e-mail: bernd.schubert@pci.uni-heidelberg.de
