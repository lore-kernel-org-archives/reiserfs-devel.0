From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: 'let the hdd remap the bad blocks'
Date: Tue, 20 Aug 2002 11:27:39 +0200
Message-ID: <m3u1lpx4l0.fsf@merlin.emma.line.org>
References: <5.1.1.6.2.20020819155611.01ff7af0@pop.tvnet.hu>
	<20020819195906.A19984@namesys.com> <3D614477.8050500@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11249-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D614477.8050500@namesys.com> (Hans Reiser's message of "Mon,
 19 Aug 2002 23:18:15 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> writes:

> Just taking a guess, many hard drives have difficult and time-consuming
> procedures that they can go through to read a troublesome block.  These
> can take 20-30 seconds.  Probably if they have to go through these
> procedures, once they finally succeed the smart vendors remap the block.

They should try to rewrite and write verify the block before remapping
it, as there is only a finite amount of spares.

For SCSI drives, there's also J=F6rg Schilling's "sformat" tool that can
do the "badblocks" stuff directly in the drive rather than through all
the kernel buffers, and can also refresh or reassign bad blocks.

--=20
Matthias Andree
