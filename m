From: Enrique Perez-Terron <enrique.perez-terron@norway.online.no>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas
	thread)
Date: Wed, 14 Apr 2004 04:18:15 +0200
Message-ID: <1081909092.6753.64.camel@arabia.home.lan>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com>
	 <407AEA05.50004@pobox.com> <407BFBEA.5010006@pobox.com>
	 <407C15D9.1080705@namesys.com> <407C1BE9.8010509@pobox.com>
	 <407C279A.3060303@namesys.com> <407C3004.3070401@pobox.com>
	 <407C316B.80606@namesys.com> <407C35B0.3080109@pobox.com>
	 <200404132031.i3DKVqRg009355@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17915-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404132031.i3DKVqRg009355@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Tue, 2004-04-13 at 22:31, Valdis.Kletnieks@vt.edu wrote:
> On Tue, 13 Apr 2004 13:47:12 CDT, "John D. Heintz" said:
> > foo/nsa:permissions -> foo/nsa.gov/secure-linux/permissions
> >=20
> > This assumes a mapping from "nsa" -> "nsa.gov/security/".

Implementing a mapping "nsa" -> "nsa.gov/security/" does not remove the
headache of what to do with a tarball containing a directory named
"nsa".

While domain names are assigned in a process that guarantees uniqueness,
subdirectories in software distributions are not naturally subject to
the same constraints. This invalidates much of the theory in this thread
of discussion. (Of course, the likelihood of anyone other than Hans & al
actually using a directory name www.namesys.com is more than
sufficiently remote to be a non-problem.

Remember Murphy's law? I think the pseudodirectory name "metas" will
bite us in our metas. (Recall, "meta" is a Greek word meaning "behind"
or "after", right? Aristotle's Metaphysics got its name because it was
the tome after Physics, Nature.)

People with startup businesses look for sexy names for their pets, and
names like MetaCity are sexy. When all names like InfoSoft, UniSoft,
MicroSoft etc ad nauseam are used up, combinations with meta might
become the next wave any time. Directories named metas are certain to
show up often enough to be of concern.

The very same reasons why filesystem people talk about file metadata,
apply to other people as well. It is not hard to imagine a source code
control system calling some of its files "metafiles" or something
similar.

Both Spanish and Portuguese have "metas" as commonly used words meaning
goals. This is another source of conflicting file and directory names.=20

Tar file makers will swear that people installing a file system that do
not allow arbitrary a-z names of length <=3D eight, deserve all the
problems they get. They will refuse to have to learn by heart all the
non-portable names in this category.

System administrators don't want to have complaints from users just
because some names consisting of only a-z characters are reserved.=20
Especially if one of the users is their boss.  They don't care how
seldom the problem actually arises.  They will simplify matters to the
rule: "Reiser4 is not a general-purpose file system, there are some
files it cannot store."

Linux distributors, system administrators and tar ball maintainers will
read eachother's minds, and the distributors will recompile the kernel
with some punctuation character in the reserved name. The major
distributors will look at eachother and agree on the same name. Their
choice will be a good one, provided they find reiser4 interesting for
their users. They won't care about Hans' aesthetic senses.

In the mean time, the xml namespace theoreticians are close to making a
good point: Any software maintainer (other than Hans & al) creating
tarballs with files or directories named reiser4 deserve bad luck.  And
their number is close enough to zero.

On the other hand, end users that have never used Linux and who dislike
punctuation characters, dislike '/' no less. They want to be able to put
'/' into the file names, like "Spending proposal 2004/3Q". But they
usually never see a shell, and navigate the file system by clicking on
one folder at the time. They will never grep the metadata. They will
only see the metadata in specially tailored dialogs.

Regards,
Enrique P=E9rez-Terr=F3n

