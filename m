From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Re: Some kind of benchmark
Date: Wed, 2 Jun 2004 17:11:34 +0200
Message-ID: <200406021711.34994.marcel@hilzinger.hu>
References: <200406011832.30163.marcel@hilzinger.hu> <1086168950.24589.4.camel@tribesman.namesys.com> <1086182176.22636.3449.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18971-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1086182176.22636.3449.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

2004. j=FAnius 2. 15.16 d=E1tummal Chris Mason ezt =EDrta:
> On Wed, 2004-06-02 at 05:35, Vladimir Saveliev wrote:
> > Suse kernel differs from stock one substantially. I guess. So, it is
> > very likely that those changes (which are not reiserfs only, certainly)
> > are responsible for that difference.
> > When suse experts will wake up they will say more details about what
> > might cause overwrite speedup
>
> Well, the suse kernel has a lot of patches that are supposed to make
> things faster.  Try benchmarking against 2.6.6 or 2.6.7-rc1, which has
> most of them included.

I tried to build 2.6.7-rc1 (with patch from auto-snapshot), but I got this=
=20
error message:

  CC      fs/reiser4/plugin/object.o
fs/reiser4/plugin/object.c: In function `delete_inode_common':
fs/reiser4/plugin/object.c:979: error: structure has no member named=20
`i_sb_list'
make[2]: *** [fs/reiser4/plugin/object.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2

Thanks.
Marcel

=2D-=20
=DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
Marcel Hilzinger

