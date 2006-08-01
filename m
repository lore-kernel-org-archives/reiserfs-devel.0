From: "Nate Diller" <nate.diller@gmail.com>
Subject: Re: reiser4: maybe just fix bugs?
Date: Tue, 1 Aug 2006 12:26:38 -0700
Message-ID: <5c49b0ed0608011226w328d809fy9d50aa785ad93536@mail.gmail.com>
References: <1158166a0607310226m5e134307o8c6bedd1f883479c@mail.gmail.com>
	 <20060801013104.f7557fb1.akpm@osdl.org> <44CEBA0A.3060206@namesys.com>
	 <1154431477.10043.55.camel@tribesman.namesys.com>
	 <20060801073316.ee77036e.akpm@osdl.org>
	 <1154444822.10043.106.camel@tribesman.namesys.com>
	 <44CF879D.1000803@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29421-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CF879D.1000803@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, Andrew Morton <akpm@osdl.org>, vda.linux@googlemail.com, linux-kernel@vger.kernel.org, Reiserfs-List@namesys.com

On 8/1/06, David Masover <ninja@slaphack.com> wrote:
> Vladimir V. Saveliev wrote:
>
> > Do you think that if reiser4 supported xattrs - it would increase its
> > chances on inclusion?
>
> Probably the opposite.
>
> If I understand it right, the original Reiser4 model of file metadata is
> the file-as-directory stuff that caused such a furor the last big push
> for inclusion (search for "Silent semantic changes in Reiser4"):
>
> foo.mp3/.../rwx    # permissions
> foo.mp3/.../artist # part of the id3 tag
>
> So I suspect xattrs would just be a different interface to this stuff,
> maybe just a subset of it (to prevent namespace collisions):
>
> foo.mp3/.../xattr/ # contains files representing attributes
>
> Of course, you'd be able to use the standard interface for
> getting/setting these.  The point is, I don't think Hans/Namesys wants
> to do this unless they're going to do it right, especially because they
> already have the file-as-dir stuff somewhat done.  Note that these are
> neither mutually exclusive nor mutually dependent -- you don't have to
> enable file-as-dir to make xattrs work.
>
> I know it's not done yet, though.  I can understand Hans dragging his
> feet here, because xattrs and traditional acls are examples of things
> Reiser4 is supposed to eventually replace.
>
> Anyway, if xattrs were done now, the only good that would come of it is
> building a userbase outside the vanilla kernel.  I can't see it as doing
> anything but hurting inclusion by introducing more confusion about
> "plugins".
>
> I could be entirely wrong, though.  I speak for neither
> Hans/Namesys/reiserfs nor LKML.  Talk amongst yourselves...

i should clarify things a bit here.  yes, hans' goal is for there to
be no difference between the "xattr" namespace and the "readdir" one.
unfortunately, this is not feasible with the current VFS, and some
major work would have to be done to enable this without some
pathological cases cropping up.  some very smart people think that it
cannot be done at all.

xattr is a seperate VFS interface, which avoids those problems by
defining certain restrictions on how the 'files' which live in that
namespace can be manupulated.  for instance, hard links are
non-existent, and the 'mv' command cannot move a file between
different xattr namespaces.

enabling xattr would have no connection to the file-as-directory
stuff, and (without extra work) would not even allow access to the
things reiser4 defined in the '...' directory.  also enabling xattr in
the way i intend would in no way compromise hans' long-term vision.

HOWEVER, i *need* to point out that hans and i disagree somewhat on
the specifics here, and so i should say adamently "i don't speak here
on behalf of hans or namesys".

that won't stop me from submitting my own patch though :)

NATE
