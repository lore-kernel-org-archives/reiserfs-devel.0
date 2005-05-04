From: Radovan Garabik <garabik@melkor.dnp.fmph.uniba.sk>
Subject: Re: quota, reiserfs v3, 2.6.11.7
Date: Wed, 4 May 2005 08:55:43 +0200
Message-ID: <20050504065543.GA24296@melkor.dnp.fmph.uniba.sk>
References: <20050502083334.GA19785@melkor.dnp.fmph.uniba.sk> <1115131282.17190.98.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23972-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1115131282.17190.98.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

On Tue, May 03, 2005 at 06:41:22PM +0400, Vladimir Saveliev wrote:
>=20
> The attached patch should eliminate clm-2100. However, it is very likely
> that PAP-5660 is caused by filesystem error. Would you mind to
> reiserfsck?

I did, first reiserfsck was run automatically during the reboot(s) and
did find and repair some errors. After I turned quotas off, I ran
reiserfsck manually again and the filesystem was clean.

I could try to use quotas again, but I am afraid the downtime would not
be welcome at all...

--=20
 -----------------------------------------------------------
| Radovan Garab=EDk http://kassiopeia.juls.savba.sk/~garabik/ |
| __..--^^^--..__    garabik @ kassiopeia.juls.savba.sk     |
 -----------------------------------------------------------
Antivirus alert: file .signature infected by signature virus.
Hi! I'm a signature virus! Copy me into your signature file to help me spre=
ad!
