From: Nikita Danilov <Nikita@Clusterfs.COM>
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Fri, 13 Aug 2004 14:00:04 +0400
Message-ID: <16668.37156.126350.883214@laputa.namesys.com>
References: <cd32a06204080910256de4cc0e@mail.gmail.com>
	<200408122138.46787.frbiscani@jumpy.it>
	<200408130031.13061.vitaly@namesys.com>
	<200408122308.06962.frbiscani@jumpy.it>
	<20040813091612.GF13834@backtop.namesys.com>
	<20040813093119.GI1284@nysv.org>
	<411C8D45.1000709@namesys.com>
	<20040813094431.GJ1284@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20258-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040813094431.GJ1284@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: mjt@nysv.orgMarkus=?unknown-8bit?q?T=F6rnqvist?=
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Markus T=F6rnqvist writes:
 > On Fri, Aug 13, 2004 at 01:43:33PM +0400, Vladimir V. Saveliev wrote:
 > >
 > >I think only empty directory can be refibrated.
 > >>Are you thinking about implementing it/is it a matter of time and mone=
y?
 > >Reiser4 provides plugin mechanism. Everyone is encouraged to write plug=
ins.
 >=20
 > Aren't those two sentences a bit contradictory?-)
 >=20
 > I mean, if it's possible only to (re)fibrate empty directories, is it
 > impossbile to write a means of refibration to a new plugin or the existi=
ng
 > plugin? :)

Currently echo 'foo' > foo/metas/plugin/fibration

simply changes id of fibration plugin associated with foo. Doing this
on non-empty foo would result in corruption and hence is
disabled. Vladimir, as far as I can tell, meant that if one writes
support for re-fibrating directory content, changing fibration plugin
on non-empty directory can be allowed.

If I were going to implement such thing, I would proceed as follows:

 - mark directory stat-data (on-disk) in special way. Any normal
 access to marked directory returns EBUSY.

 - start re-fibrating directory content.

 - use safe-link mechanism to assure that if crash happens during
 re-fibration, it will be continued on next mount. (Yes, this sounds
 like possible DoS for a large directory, so probably only `user with
 proper permissions' should be allowed to do re-fibration.)

 - when re-fibration is completed, clear mark from stat-data.

 >=20
 > Thanks!
 >=20
 > --=20
 > mjt
 >=20

Nikita.

 >=20
