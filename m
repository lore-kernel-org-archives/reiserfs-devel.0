From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: non volatile ram devices
Date: Sat, 07 Dec 2002 18:13:03 +0100
Message-ID: <m3vg25rbvk.fsf@merlin.emma.line.org>
References: <200212042059.35300.russell@coker.com.au>
	<200212051000.32340.russell@coker.com.au>
	<1039094639.8199.119.camel@tiny>
	<200212061052.59139.russell@coker.com.au>
	<m3wummpuzp.fsf@merlin.emma.line.org>
	<20021207040909.GJ9512@mrball.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12129-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021207040909.GJ9512@mrball.net> (Todd Lyons's message of
 "Fri, 6 Dec 2002 20:09:09 -0800")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Todd Lyons <todd@mrball.net> writes:

>>> I'm using a fairly vanilla kernel.  It's performance is 2 messages per =
second=20
>>> taken from qmail spool and delivered while there is a background load o=
f pop=20
>>> access and new incoming mail.  IE if there is a backlog of mail to deli=
ver=20
>>> the backlog gets smaller by 120 messages per minute.
>>In my benchmarks on a plain FreeBSD ffs and a Micropolis 4345WS UWSCSI
>>disk drive (7200/min) that was otherwise idle, qmail maxes out for
>>remote 1-to-1 deliveries at a good 3 deliveries/s. It might improve a
>
> You need to increase your remoteconcurrency limit.  Unless your emails
> are 10's of Megabytes each, 3/s is way low.

No, I don't -- most time of the test, qmail was running from 0 to 2
qmail-remote processes. This only changes when the todo queue has been
drained completely and no more mail needs to be preprocessed. Only after
the todo is empty, qmail ramps up into the remoteconcurrency limit. And
I'd certainly not raise remoteconcurrency above 20 because qmail would
easily trample the destination host if I had many recipients in one
domain, giving me "false" deferrals (because it's ran into the tcpserver
limit of the MX it's talking to).

See Andr=E9 Oppenheim's "silly qmail syndrome patch" and the corresponding
graphs at http://www.nrg4u.com/

--=20
Matthias Andree
