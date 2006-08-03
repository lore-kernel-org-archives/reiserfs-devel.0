From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Re: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with filled fs, looks stable to me...)
Date: Thu, 3 Aug 2006 10:55:42 +0200
Message-ID: <200608031055.42846.marcel@hilzinger.hu>
References: <20060730223755.GA14386@hermes.uziel.local> <1692247736.20060801231255@wp.pl> <1154469566.10745.48.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29448-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1154469566.10745.48.camel@localhost>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Am Dienstag, 1. August 2006 23:59 schrieb Sander Sweers:
> On Tue, 2006-08-01 at 23:12 +0200, Maciej So=B3tysiak wrote:
[...]
> Are there any on the list who know of rpm's for Suse/Redhat/Mandrake
> that include reiser4?
Suse excluded reiser4 from 10.1 because they want to keep the kernel "clean=
er"=20
than in previous versions. Il ask what's the status with 10.2, but I think=
=20
it's still left out. With the new build-server=20
(http://en.opensuse.org/Build_Service) it shouldn't be too hard to build=20
packages. Also Suse supports now special packages for kernel-modules, which=
=20
can even survive a kernel-update, if the API does not change.

But I see another important point: Reiser4 is very fast if you have more th=
an=20
one reiser4 partition. But: most home users make one or two reiser4=20
partitions for testing purpose. Until the whole system does not run on=20
reiser4 the speed improvement cannot be felt 100%. So community members=20
should make pressure at Suse, Fedora, Mandriva to get reiser4 supported by=
=20
the distro.
=2D-=20
=DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
Marcel Hilzinger
