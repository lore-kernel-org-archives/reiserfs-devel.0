From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: when distros do not support official Marcelo kernels they are not being team players (was Re: reiserfs on redhat advanced server?)
Date: Thu, 6 Feb 2003 19:06:53 +0100
Message-ID: <200302061906.53534.bernd-schubert@web.de>
References: <20030131122147.GE15359@marowsky-bree.de> <3E403488.9050408@namesys.com> <1044397378.15684.714.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12665-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1044397378.15684.714.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, Hans Reiser <reiser@namesys.com>
Cc: Hubert Mantel <mantel@suse.de>, reiserfs-list@namesys.com

On Tuesday 04 February 2003 23:22, Chris Mason wrote:
> On Tue, 2003-02-04 at 16:45, Hans Reiser wrote:
> > The official kernel is our kernel community's only chance to overcome
> > its fragmentation.  We need to support it.
>
> We do support the official kernel, by actively developing and improving
> it, and by answering questions on public mailing lists.  When things
> work in our kernel (like reiserfs, or andrea's vm etc) we work to get i=
t
> into the vanilla kernel.  We're also constantly updating our work to
> keep it in line with the current vanilla sources.  It takes a while due
> to the volume of patches and testing required, but we're always working
> on it.
>

Hmm, I know its out of topic, but I want to take my chance and complain a=
bout=20
the Suse kernel.

We are currently testing one of our servers with non-free software and on=
ly=20
get a pre-compiled kernel module from this company. Unfortunality they on=
ly=20
have kernel modules for well knows Distros, such as Suse, RedHat, etc and=
 it=20
seems to be very difficult to convince them to compile it for a vanilla=20
kernel.
So we are using a Suse kernel on Debian. For some reason we couldn't use =
the=20
binary and had to recompile the kernel from the source Suse provides. Wel=
l,=20
until it came to the module part everything was fine, but then errors=20
orrcured and we had to find the config options to disable those modules.=20
Since we first tried to use the config-options Suse had set as default, t=
he=20
Suse-people *MUST* have seen themselves that it doesn't work this way.=20
The other thing I'm strongly wondering about, is what for nomal home user=
s=20
need a kernel that has kdb and other very seldom used patches included. W=
hich=20
usual home-user (and that is what I thought to be Suse for) needs kernel=20
debugging? IMHO kernel debuggers won't have a problem with patching a ker=
nel=20
themselves.

Finally we got it working and could even load the module, but later on we=
=20
figured out that nfs file locking for imports from another server isn't=20
working properly (/proc/mounts shows that it is enabled, but e.g. 'man'=20
complains that it is not). Well, actually I'm wondering that anything wor=
ks=20
in such a stronlgy patched kernel.=20
Of course, the nfs file locking works when we use a vanilla kernel.

So whom shall I blame it is not? Suse, and tell them we are only using th=
eir=20
kernel (and this not even without some force)? And I believe people from =
the=20
kernel mailinglist won't feel responsible, too.

Just a few reasons why I don't like using distros' kernels !

Best regards,
=09Bernd

PS: The kernel is 2.4.19-4GB, I've forgotten which one of Suses subversio=
ns it=20
was, but it was rather high (174?).
