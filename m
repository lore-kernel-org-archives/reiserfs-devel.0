From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: udpated data logging available
Date: Thu, 26 Jun 2003 15:36:23 +0200
Message-ID: <3EFAF6D7.9040408@netscape.net>
References: <1055764071.24111.650.camel@tiny.suse.com>	 <200306260216.41204.christian.mayrhuber@gmx.net>	 <1056592066.20899.10.camel@tiny.suse.com>	 <200306261342.08725.Dieter.Nuetzel@hamburg.de> <1056632026.20899.39.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14712-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 06/26/2003 02:53 PM, Chris Mason wrote:
> On Thu, 2003-06-26 at 07:42, Dieter N=FCtzel wrote:
>=20
>>>Great to hear, thanks for giving it a try.  io-stalls-6 helped most when
>>>you've got multiple devices and a streaming write to one was slowing
>>>down all the others.  -7 added in a tweaked form of Andrea's elevator
>>>latency fixes, and they make a big difference when there's a lot of
>>>writes to the drive you're trying to read from.
>>
>>So, does it apply to 2.4.21-aa1 (latest is 2.4.21rc8aa1) cleanly? ;-)
>>
>=20
> No, io-stalls-7 is mostly in rc8aa1 already.  The major difference is
> that andrea changed blk_finished_io and I added a new func to keep
> compatibility for external drivers.  There are a few areas where he and
> I chose different ways of doing things, if you're interested in helping
> add some measurements to our debate, I can make you a patch against aa1.
>=20
>>>Hopefully we'll be able to hash out something suitable for 2.4.22-pre.
>>
>>2.4.22-pre1 is out form some days...
>=20
> Yes.  Almost all my latency testing was done on data logging + the jh-2
> patch, so I'm much more confident now in that code.  Hopefully the
> merging will start shortly, Oleg has a queue of things he wants to get
> in, and we're trying to keep the rate of changes at something
> manageable.
>=20
> (quick clarification, io-stalls-7 is entirely unrelated to reiserfs, I
> posted it here because I thought there might be some willing testers ;-)
>=20
> -chris

Hi,

the complete data-logging patchset including the experimental ones is
running fine on here, kernel 2.4.21-final without quota, with
rml-preempt-kernel and with the "old" search_reada-4. It also ran fine
with the previous reiserfs-jh-1 and io-stalls-6 before.

Does the search_reada-4 contradict the new code or is it even dangerous
to combine them (what I luckily didn't trigger so far)?

Thanks,

 Manuel

