From: michael chang <thenewme91@gmail.com>
Subject: Re: undelete
Date: Sun, 6 Nov 2005 10:32:45 -0500
Message-ID: <b14e81f00511060732r3fd6f4c2w5034c978d501902b@mail.gmail.com>
References: <871119507.20051103221858@pobox.com>
	 <1131281467.4478.6.camel@test.asus>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26790-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1131281467.4478.6.camel@test.asus>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jzobel@heute-morgen.de
Cc: reiserfs-list@namesys.com, Chris Drake <christopher@pobox.com>

On 11/6/05, Joachim Zobel <jzobel@heute-morgen.de> wrote:
> Am Donnerstag, den 03.11.2005, 22:18 +1100 schrieb Chris Drake:
> > The most important feature of Microsofts new server file-system
> > announcement is the ability to easily "undelete":-
> > http://www.microsoft.com/windowsserver2003/evaluation/overview/technolo=
gies/storage.mspx
> >
> > Could this be incorporated into reiserfs ?  (including the recovery of
> > overwritten files etc of course)
>
> Are you referring to the "Volume Shadow Copy Service"? This is not a FS
> feature, it is AFAIK implemented below in the "block device layer" (this
> has quite shure a different name on windows). You can do the same thing
> on Linux with LVM (it was however not usable with LVM2 on my system at
> the beginning of the year).
>
> A real file system undo would however be really good to have.
>

Indeed, although I wouldn't be surprised if someone went and
complained and said this should be implemented at the VFS layer, just
like file plugins (cryptocompress and the like) and file-as-dir,
simply because somebody wanted this feature to affect all filesystems.
 (But IIRC, that already exists; pseudofilesystems allow this sorta
thing, as mentioned in a recent e-mail, provided you'd want to set
such a thing up.)

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
