From: Roland <roland@xebec.de>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Mon, 31 Mar 2003 22:44:23 +0100
Message-ID: <200303312344.23931.roland@xebec.de>
References: <200303281828.55093.bernd-schubert@web.de> <200303291933.48476.roland@xebec.de> <20030331122820.D25533@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13502-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030331122820.D25533@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hi Oleg,

i've forgot to CC to reiserfs-list last time, so i do a full quote.

On Monday 31 March 2003 10:28, you wrote:
> Hello!
>
> On Sat, Mar 29, 2003 at 07:33:48PM +0100, Roland wrote:
> > i've read your thread very interessted, because i think i've a very
> > similar problem (but until know, i didn't think about reiserfs as
> > source): kernel 2.4.20 SMP, HighMem, HighMem IO (without ptrace patch=
)
> > root filesystem ~70GB ext3 on Compaq CISS
> > /data filesystems ~1.1TB reiserfs (on top of lvm) on a second Compaq =
CISS
> > System: Compaq Dual PIII 2GB Ram
> > the system is used as nfs fileserver for diskless clients (about 30 r=
ight
> > now) first we experienced high load situations during daily cron jobs=
,
> > later we saw log messages very similar to what Bernd has
> > (/usr/sbin/logrotate, /usr/lib/perl5/...) and last week we had a cras=
h of
> > the fileserver (no sysreq key's, console blanking didn't responded, p=
ing
> > to system was ok)
>
> Was there anything in logs after reboot?

no, nothing...

> > since that crash we don't have any 'nfsd-fh: found a name that I didn=
't
> > expect:' messages; but we need to find out what was behind that crash=
=2E..
> > Any ideas?
>
> If only you had related kernel oops/whatever was caused the crash
> (either on your HDD, or captured via serial console/network oops
> dumper/whatever), that would be much easier.

the system has no serial console attached *sight*, the logs on disk carri=
ed=20
nothing useful...

> > (it would be possible for me to provide a machine which is 100% ident=
ical
> > to our production fileserver if this would help for tests, but i don'=
t
> > have ressources to put up more than one client for this testsystem...=
)
>
> Since we do not know yet on how to produce those nfsd-fh stuff, there i=
s no
> point in using your test server yet.

hmm... ok if you think it can be useful, let me know...

Greetings,

Roland

