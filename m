From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: To compare Linux journalised filesystem, part II.
Date: Thu, 24 Oct 2002 20:52:29 +0400
Message-ID: <15800.9549.974775.3912@laputa.namesys.com>
References: <3DB823AA.6010405@eprocess.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11765-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DB823AA.6010405@eprocess.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Fabien Combernous <fcombernous@eprocess.fr>
Cc: ext3-users@redhat.com, jfs-discussion <jfs-discussion@www-124.southbury.usf.ibm.com>, reiserfs <reiserfs-list@namesys.com>, linux-xfs@oss.sgi.com

Fabien Combernous writes:
 > Back,
 >=20
 > After to get all informations i received, i put them in table as follow:
 >=20
 >   see attachment file.
 >=20
 > Specialists can they tell me if they agree with my conclusions ?
 >=20
 > Thank's for your good job.
 >=20
 > Fabien.
 >=20
 > --=20
 >=20
 > Fabien COMBERNOUS - IT Engineer
 > eProcess - Parc Club du Mill=E9naire Batiment n=B0 6
 > 1025 rue Henri Becquerel - 34000 Montpellier FRANCE
 > http://www.eprocess.fr - +33 (0)4 67 13 84 50
 > +------------------+-----+------+-----+----------+----------------------=
--------------------------------------------------+
 > | Features \ fs    | xfs | ext3 | jfs | reiserfs |                      =
          Comments                                |
 > +------------------+-----+------+-----+----------+----------------------=
--------------------------------------------------+
 > | mmutable         |  N  |  Y   |  Y  |    Y     | "Y" is not with same =
sens. Implementation is not same. Each one permit |
 > | append-only      |     |      |     |          | some elements that ot=
her don't permit and reverse. xfs will have       |
 > |                  |     |      |     |          | implementation in fut=
ur.                                               |
 > +------------------+-----+------+-----+----------+----------------------=
--------------------------------------------------+
 > | quotas           |  Y  |  Y   |  Y  |    Y     | Again "Y" is not aqua=
l. ext3 accept quota only on data-journaled       |
 > |                  |     |      |     |          | filesystems, but all =
other journaled filesystem don't have data journal|
 > |                  |     |      |     |          | About reiserfs you ne=
ed Chris patches.
 > +------------------+-----+------+-----+----------+----------------------=
--------------------------------------------------+
 > | NFS              |  Y  |  Y   |  Y  |    Y     | nfs works on all of t=
hem. You need at least reiserfs v3.6.
 > +------------------+-----+------+-----+----------+----------------------=
--------------------------------------------------+
 > | samba            |  Y  |  Y   |  Y  |    Y     | Since Samba is usersp=
ace, the fs shouldn't matter (2.2.4 or 2.2.5)     |
 > +------------------+-----+------+-----+----------+----------------------=
--------------------------------------------------+
 > | coda             | coda is a file sys him self |            /         =
      /              /              /             |
 > +------------------+-----+------+-----+----------+----------------------=
--------------------------------------------------+
 > |data journal      |  N  |  Y   |  N  |    N     | Only ext3 can take ca=
re of data by a data journal. All other journaled |
 > |                  |     |      |     |          | file systems have "on=
ly" a metadata journal.                           |
 > +------------------+-----+------+-----+----------+----------------------=
--------------------------------------------------+


Reiserfs supports data journalling with yet another set of Chris
patches: ftp://ftp.suse.com/pub/people/mason/patches/data-logging/

Nikita.
