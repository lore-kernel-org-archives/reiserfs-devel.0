From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 03 Sep 2004 01:15:48 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <87sma0vsor.fsf@uhoreg.ca>
References: <200408261034.38509.vda@port.imtp.ilyichevsk.odessa.ua> <Pine.LNX.4.44.0408260736080.23532-100000@chimarrao.boston.redhat.com>
 <20040826121223.GG30449@mail.shareable.org>
 <4137F4D9.7040206@pointblue.com.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>>>>> "Grzegorz" =3D=3D Grzegorz Ja=C5=9Bkiewicz <gj@pointblue.com.pl> =
writes:

Grzegorz> Jamie Lokier wrote:
>> Note that file-as-directory doesn't imply that you can store just
>> anything into those directories.
>>=20
>> Is it a problem to decree that "file data MUST NOT be stored in a
>> metadata directory; only non-essential metadata and data computed
>> from the file data may be stored"?

Grzegorz> That's exactly what folks seem to lost in this debate.
Grzegorz> We (developers) want to have files as dirs to:
Grzegorz> * be able to extract/modify file part on fly. For instance,
Grzegorz> simple .iso file, without need to mount it over loop (btw, if
Grzegorz> someone is going to redesign VFS, can we handle that kinda
Grzegorz> case too please?), .tar, or unzipped (kernel can handle zips)
Grzegorz> "streams". File is a stream, why shouldn't I have a chance to
Grzegorz> grab a stream out of archive/image than ?

I'm not entirely convinced that it's a good idea.  At least, I agree
with those who say that they don't want a tar parser in the kernel.  I
would only want this to happen if the parsing is handled in a
user-space helper that somehow connects to the kernel.

Grzegorz> * be able to store metadata, that doesn't matter on copy, and
Grzegorz> even should not be copied sometimes. Things like thumbnails,
Grzegorz> metainformation (used for search). All of these extracted fro=
m
Grzegorz> acctual file (either by VFS 'plugins', or by userspace
Grzegorz> application), and saved there so that it can be used later
Grzegorz> on. So we save some time on extracting it.

Yes.  I think that file-as-dir is useful for things like when Nautilus
wants to store a thumbnail, or annotations (their "emblems", notes,
etc.).  In the situation right now, if you copy something using cp, you
lose all that information already.  If file-as-dir is implemented, then
when you cp on a filesystem that supports it, you don't lose your notes=
=2E
If you cp to a filesystem that doesn't support it, well, you would have
lost that information under the old scheme anyways.

I also think that file-as-dir is also useful for exporting new metadata=
,
like acl's or other access control schemes.  Again, if you copy to a
filesystem that doesn't implement these, then you would have lost that
information anyways.  But it presents a nice consistent interface.  But
in this way, you get an easy way to access this stuff that programmers
won't have to spend (much) time to learn about.  (Only time spent shoul=
d
be learning the naming convention.)

Of course, you could do all this with openat(), but people who are
reading this thread should already know my opinions on openat(), so
we'll leave that out.

--=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
=46ingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

-
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
