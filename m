From: Hans Reiser <reiser@namesys.com>
Subject: Re: 'let the hdd remap the bad blocks'
Date: Tue, 20 Aug 2002 13:55:06 +0400
Message-ID: <3D6211FA.3010500@namesys.com>
References: <5.1.1.6.2.20020819155611.01ff7af0@pop.tvnet.hu>	<20020819195906.A19984@namesys.com> <3D614477.8050500@namesys.com> <m3u1lpx4l0.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11250-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

Matthias Andree wrote:

>Hans Reiser <reiser@namesys.com> writes:
>
> =20
>
>>Just taking a guess, many hard drives have difficult and time-consuming
>>procedures that they can go through to read a troublesome block.  These
>>can take 20-30 seconds.  Probably if they have to go through these
>>procedures, once they finally succeed the smart vendors remap the block.
>>   =20
>>
>
>They should try to rewrite and write verify the block before remapping
>it, as there is only a finite amount of spares.
>
>For SCSI drives, there's also J=F6rg Schilling's "sformat" tool that can
>do the "badblocks" stuff directly in the drive rather than through all
>the kernel buffers, and can also refresh or reassign bad blocks.
>
> =20
>

Vitaly, take a look at that.  Part of a good user interface is letting=20
users know what tools are available.  Remember, most users will=20
encounter a failing drive and/or fsck on a journaling fs as a rare and=20
stressful event in their lives, so it is good to educate them with URLs=20
and other references at the time they run fsck.

