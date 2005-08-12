From: Tarmo =?ISO-8859-1?Q?T=E4nav?= <tarmo@itech.ee>
Subject: Re: BUG: reiserfs+acl+quota deadlock
Date: Fri, 12 Aug 2005 19:17:50 +0300
Message-ID: <1123863470.14337.1.camel@localhost>
References: <1123643111.27819.23.camel@localhost>
	 <20050810130009.GE22112@atrey.karlin.mff.cuni.cz>
	 <1123684298.14562.4.camel@localhost>
	 <20050810144024.GA18584@atrey.karlin.mff.cuni.cz>
	 <42FCB873.8070900@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25429-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FCB873.8070900@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, mason@suse.com, jeffm@suse.com, grev@namesys.com

On R, 2005-08-12 at 18:55 +0400, Vladimir V. Saveliev wrote:
>=20
> It looks like the problem is that reiserfs_new_inode can be called either=
 having xattrs locked or not.
> It does unlocking/locking xattrs on error handling path, but has no idea =
about whether
> xattrs are locked of not.
> The attached patch seems to fix the problem.
> I am not sure whether it is correct way to fix this problem, though.
>=20
> Tarmo, please check if this patch works for you.


Sorry, I made a mistake when I first tested the patch, got some
kernel images mixed up, it does fix the problem, thank you.



--=20
Tarmo T=E4nav <tarmo@itech.ee>

