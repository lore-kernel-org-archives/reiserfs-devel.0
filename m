From: Radovan Garabik <garabik@melkor.dnp.fmph.uniba.sk>
Subject: Re: mount reiserfs3 REALLY read only?
Date: Mon, 20 Dec 2004 13:49:22 +0100
Message-ID: <20041220124922.GA18135@melkor.dnp.fmph.uniba.sk>
References: <20041206123706.GA25176@melkor.dnp.fmph.uniba.sk> <1102340556.5598.81.camel@tribesman.namesys.com> <20041206165337.GA25094@melkor.dnp.fmph.uniba.sk> <1102592473.3666.53.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1102592473.3666.53.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Thu, Dec 09, 2004 at 02:41:14PM +0300, Vladimir Saveliev wrote:
> Hello
>=20
> Sorry for delay. I had some problems here

Never mind, in the meantime I got some external USB harddisks,
created a 1.1TB software RAID (have you seen a RAID over 4 IDE and 3 USB=20
disks? :-)), copied the partition over and successfully  recovered
the data.

This brings us back to the beginning: IMHO having the option to mount
reiserfs read-only comes sometimes very useful. Apart from emergency
situations, the size of USB mass storage devices is getting big enough
to consider putting better filesystem (instead of VFAT) on them. Many of th=
ese
devices have hardware switches to make them read-only, and therefore
unmountable at the current state of affairs.=20
After clean unmount, you do not need a journal to replay, and since you
indend to mount the fs read only, you do not need a journal at all.
XFS can do it with -o norecovery,ro, why reiserfs can't?


--=20
 -----------------------------------------------------------
| Radovan Garab=EDk http://melkor.dnp.fmph.uniba.sk/~garabik/ |
| __..--^^^--..__    garabik @ melkor.dnp.fmph.uniba.sk     |
 -----------------------------------------------------------
Antivirus alert: file .signature infected by signature virus.
Hi! I'm a signature virus! Copy me into your signature file to help me spre=
ad!
