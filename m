From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Oh no! Not again!
Date: Wed, 29 Jan 2003 23:17:25 +0300
Message-ID: <200301292317.25045.vitaly@namesys.com>
References: <20030117221535.GA945@Kadath> <200301281400.09364.vitaly@namesys.com> <20030129193126.GA1367@ZhengHe.augustin.thierry>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12551-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030129193126.GA1367@ZhengHe.augustin.thierry>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Francois-Rene Rideau <fare@tunes.org>
Cc: reiserfs-list@namesys.com

On Wednesday 29 January 2003 22:31, Francois-Rene Rideau wrote:
> OK. So I built the latest reiserfsck as a static binary,
> and ran it with --rebuild-tree, and I got an infinite loop
> just like previously. In case anyone cares, I have kept the logfile for i=
t.
> Is there anything that interests you about that failure,
> or should I promptly reformat the disk?

Did you run the fsck (booted from /boot) when the drive was in that other
mashine you had no problem with or in the problem one? It is a bad idea to =

run reiserfsck on a broken hardware - the result is unpredictable.=20

> Also, does any of you have any hint as to how to identify the failure
> that led to this crash? I suspect either the disk or the motherboard,

If you do not see any problem with the disk when you put it into another=20
computer - it is not the disk. It can be IDE controller, cable...

> but it's hard to tell: booting on my 80MB rescue disk works well,
> whereas the disk looks like it works correctly on another machine,
> and does not issue errors even on that machine, if I don't use DMA.
> Really weird. What scares me is that if I don't identify the problem,
> a similar crash may happen again...
>
> Cheers!
>
> [ Fran=E7ois-Ren=E9 =D0VB Rideau | Reflection&Cybernethics |
> http://fare.tunes.org ] [  TUNES project for a Free Reflective Computing
> System  | http://tunes.org  ] Demand the establishment of the government =
in
> its rightful home at Disneyland.

--=20

Thanks,
Vitaly Fertman
