From: Sam Vilain <sam@vilain.net> (by way of Sam Vilain <sam@vilain.net>)
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Fri, 14 Feb 2003 13:16:41 +1300
Sender: Sam Vilain <sv@vilain.net>
Message-ID: <200302141316.41198.sam@vilain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12748-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

On Fri, 14 Feb 2003 09:08, Zygo Blaxell wrote:
> Sam Vilain  <sam@vilain.net> wrote:
> >But with disks, you can.  Mirroring aside, modern hard disks use
> > S.M.A.R.>T. technology which claims to be able to spot failures befor=
e
> > they happen. Many BIOSes will let you turn this feature on and off.
> > Of course I've never actually seen it in action :-).
>
> I have seen SMART work.  At 11:20:30 I had a disk fail, then smartd put
> this in my logs:
> =09Nov  6 11:20:30 chlorine smartd: Device: /dev/hdb, Failed attribute:=
 3
> Oh, wait, you said "before"...no, I've never actually seen that in
> action either.

As you so eloquently point out in your below paragraph, I was missing the
word `some' in my statement.

> SMART does give you statistics on ECC recovery rates, temperature,
> number of remapped sectors, etc. which can give you a hint, if you keep
> track of them over time, when your disk is beginning to have more
> problems than it did have when it was newer.  Maybe about 50% of
> failures can be predicted this way (but you have no idea _when_ the
> failure will occur--this afternoon or next summer?) it's little better
> than the MTBF rating.  The other 50% of failures are predicted only
> after the fact.  :-P

Presumably 50% is a guess rather than a carefully measured statistic.  My
inclination would be towards thinking that 90% or more of failures that d=
o
not happen around the time of a power state change would be noticable by
the ECC corrections first.  The failures that happen around the time of
power state change (including power spikes) would make your statistic mor=
e
or less correct.

> The position data was
> initially written using frighteningly expensive precision hardware at
> the disk drive factory and cannot be regenerated without said equipment=
=2E

Interesting; does this happen before the platter is inserted into the
 disk? I have heard that vendors each have specific low level format
 utilities, which perform the job of remapping failed sectors and I would
 have thought, writing this timing information.  Chickens and Eggs spring
 to mind, though.

> The M in MTBF is Mean, not Maximum or Minimum.  For every disk that
> lasts 10 years or more, there's an equal and opposite disk that dies
> within a few minutes.

It actually stands for Meaningless, I'm sure :-)  Vendors should be=20
required to state this figure in terms of the number of unit failures the=
y
experienced running X units for T amount of time.
--
Sam Vilain, sam@vilain.net

Real software engineers write in languages that have not actually been
implemented for any machine, and for which only the formal spec (in
BNF) is available.  This keeps them from having to take any machine
dependencies into account.  Machine dependencies make real software
engineers very uneasy.
