From: michael chang <thenewme91@gmail.com>
Subject: Re: reiserFS error
Date: Wed, 28 Sep 2005 15:37:45 -0400
Message-ID: <b14e81f00509281237516de84c@mail.gmail.com>
References: <020a01c5c43e$d4dee100$e432a8c0@ds.ig.com.br>
Reply-To: michael chang <thenewme91@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26316-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <020a01c5c43e$d4dee100$e432a8c0@ds.ig.com.br>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Augusto <augusto@dc.ig.com.br>
Cc: reiserfs-list@namesys.com

On 9/28/05, Augusto <augusto@dc.ig.com.br> wrote:
> I have a Raid 5 format in reiserfs with kernel 2.6.13 I lost 2 hard disk =
of
> raid for the controller I obtained to force 1 of hard disk it filesystem

Raid 5 only stores one backup of data with parity, upon the loss of
two disks, valueble data (e.g. metadata?) may be lost, and this is not
recoverable.  In the future, if there is a high chance of losing two
disks at the same time, use RAID 6 (I think - it's the one that stores
double parity).  For now, try and recover data from one disk... maybe
SpinRite (grc.com,$50) will do the trick, or a professional data
recovery service, then rebuild the tree in RAID.

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
