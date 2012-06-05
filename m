From: =?iso-8859-1?Q?Llu=EDs?= Batlle i Rossell <viric@viric.name>
Subject: Re: Two hangs on reiserfs, linux 3.3.6
Date: Tue, 5 Jun 2012 21:50:34 +0200
Message-ID: <20120605195034.GY1927@vicerveza.homeunix.net>
References: <20120604222208.GP1927@vicerveza.homeunix.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120604222208.GP1927@vicerveza.homeunix.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On Tue, Jun 05, 2012 at 12:22:08AM +0200, Llu=EDs Batlle i Rossell wrot=
e:
> Hello,
>=20
> I use reiserfs since years and never saw it hang... but in this compu=
ter, that
> has two reiserfs on soft RAID1, I've seen two hangs this week.
>=20
> Here are the sysrq 'w' I could get from dmesg from the two situations=
, I hope
> they can help finding out what can this be. All the system works (roo=
tfs on
> btrfs, two data reiserfs on softraid1), but attempts to use the reise=
rfs trees
> end up in hanged processes.
>=20
> http://viric.name/tmp/hang/nispro-dmesg-hang-reiserfs.txt.gz
>=20
> http://viric.name/tmp/hang/nispro-dmesg-hang-reiserfs2.txt.gz - this,=
 a few
> minutes ago, includes all since boot.

Third hang, some minutes ago. Only two processes stuck.
http://viric.name/tmp/hang/nispro-dmesg-hang-reiserfs3.txt

I think I'm moving away from reiserfs.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
