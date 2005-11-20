From: Leo Comerford <lrc1@st-andrews.ac.uk>
Subject: Re: File as a directory - file-as-dir vs. link-dirs (again) - 3/3
Date: Sun, 20 Nov 2005 07:03:03 +0000
Message-ID: <ff8010840511192303o7c581368o119b68d78b2fe722@mail.gmail.com>
References: <ff8010840511171942x2ae2ebd0m954209103da18740@mail.gmail.com>
	 <878xvlqqhv.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27031-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: leocomerford@gmail.com
In-Reply-To: <878xvlqqhv.fsf@evinrude.uhoreg.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

On 11/19/05, Hubert Chan <hubert@uhoreg.ca> wrote:
> P.S. your relational model can easily be expressed using file-as-dir
> (well, actually, just standard directories):
>
> /(something)/father-son/aardvark/father is a symlink to
>   '/(whatever)/portrait/Mike')
> /(something)/father-son/aardvark/son is a symlink to
>   '/(whatever)/portrait/Bob')
>

Yes absolutely. Yes, my relational model *does* uses standard
directories, with three differences.

1) foofs's internal implementation of link-directories and "other"
directories might be different. Or it might not. Entirely unimportant
at this level.

2) gc might treat some link-directories differently to
predicate-directories. (If Bob and Mike have been deleted, I don't
want /(something)/father-son/aardvark/ lying around.)

3)

> --
> Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
> PGP/GnuPG key: 1024D/124B61FA
> Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
> Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.
>
>


--
Leo Richard Comerford - http://www.st-and.ac.uk/~lrc1 - accept no namesakes=
 :)
