From: Francois-Rene Rideau <fare@tunes.org>
Subject: Re: Oh no! Not again!
Date: Wed, 29 Jan 2003 20:31:26 +0100
Sender: Francois-Rene Rideau <fare@Samaris.tunes.org>
Message-ID: <20030129193126.GA1367@ZhengHe.augustin.thierry>
References: <20030117221535.GA945@Kadath> <20030124222823.GA15643@hell.mine.nu> <20030128024158.GA19336@hell.mine.nu> <200301281400.09364.vitaly@namesys.com>
Reply-To: Francois-Rene Rideau <fare@tunes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12546-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200301281400.09364.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

OK. So I built the latest reiserfsck as a static binary,
and ran it with --rebuild-tree, and I got an infinite loop
just like previously. In case anyone cares, I have kept the logfile for it.
Is there anything that interests you about that failure,
or should I promptly reformat the disk?

Also, does any of you have any hint as to how to identify the failure
that led to this crash? I suspect either the disk or the motherboard,
but it's hard to tell: booting on my 80MB rescue disk works well,
whereas the disk looks like it works correctly on another machine,
and does not issue errors even on that machine, if I don't use DMA.
Really weird. What scares me is that if I don't identify the problem,
a similar crash may happen again...

Cheers!

[ Fran=E7ois-Ren=E9 =D0VB Rideau | Reflection&Cybernethics | http://fare.tu=
nes.org ]
[  TUNES project for a Free Reflective Computing System  | http://tunes.org=
  ]
Demand the establishment of the government in its rightful home at Disneyla=
nd.
