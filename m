From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 13:14:29 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87n00hq0sq.fsf@uhoreg.ca>
References: <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org> <1453698131.20040826011935@tnonline.net>
 <20040825163225.4441cfdd.akpm@osdl.org>
 <20040825233739.GP10907@legion.cup.hp.com>
 <20040825234629.GF2612@wiggy.net> <1093480940.2748.35.camel@entropy>
 <20040826044425.GL5414@waste.org> <1093496948.2748.69.camel@entropy>
 <20040826053200.GU31237@waste.org> <20040826075348.GT1284@nysv.org>
 <20040826163234.GA9047@delft.aura.cs.cmu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20731-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Jan" =3D=3D Jan Harkes <jaharkes@cs.cmu.edu> writes:

Jan> On Thu, Aug 26, 2004 at 10:53:48AM +0300, Markus   T=F6rnqvist wrote:

[...]

>> I for one would truly welcome the coming of thumbnails and
>> descriptions in picture files, because I have a real-life project
>> going on where that would be extremely handy to have in the actual
>> file.

Jan> Ehhh, that already exists and doesn't require meta-data streams,

Jan>     http://www.exif.org/

but then you need an extra library to access the exif data.  You can't
just do something like "display foo.jpg/exif/thumbnail".  Or even
better, "echo 'this is a comment' > foo.jpg/comment" to change the jpeg
comment without an external program.

And I don't think exif tags work with all image formats.

>> On Thu, Aug 26, 2004 at 12:32:00AM -0500, Matt Mackall wrote:
>> >Find some silly person with an iBook and open a shell on OS X. Use
>> >cp to copy a file with a resource fork. Oh look, the Finder has no
>> >idea what the new file is, even though it looks exactly identical in
>> >the shell. Isn't that _wonderful_? Now try cat < a > b on a file
>> >with a fork. How is that ever going to work?

Under file-as-dir, it would not look the same under the shell if cp
didn't copy everything -- the directory contents would be different.
To copy the metadata as well, you would do something like "cp -r".
Similarly with "cat < a > b".

--=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

