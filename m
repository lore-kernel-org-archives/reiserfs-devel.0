From: Fabien Combernous <fcombernous@eprocess.fr>
Subject: To compare Linux journalised filesystem, part II.
Date: Thu, 24 Oct 2002 18:45:30 +0200
Message-ID: <3DB823AA.6010405@eprocess.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050600050304080100000904"
Return-path: <reiserfs-list-return-11764-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ext3-users@redhat.com, jfs-discussion <jfs-discussion@www-124.southbury.usf.ibm.com>, reiserfs <reiserfs-list@namesys.com>, linux-xfs@oss.sgi.com

--------------050600050304080100000904
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Back,

After to get all informations i received, i put them in table as follow:

  see attachment file.

Specialists can they tell me if they agree with my conclusions ?

Thank's for your good job.

Fabien.

--=20

Fabien COMBERNOUS - IT Engineer
eProcess - Parc Club du Mill=E9naire Batiment n=B0 6
1025 rue Henri Becquerel - 34000 Montpellier FRANCE
http://www.eprocess.fr - +33 (0)4 67 13 84 50

--------------050600050304080100000904
Content-Type: text/plain;
 name="features"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="features"

+------------------+-----+------+-----+----------+------------------------------------------------------------------------+
| Features \ fs    | xfs | ext3 | jfs | reiserfs |                                Comments                                |
+------------------+-----+------+-----+----------+------------------------------------------------------------------------+
| mmutable         |  N  |  Y   |  Y  |    Y     | "Y" is not with same sens. Implementation is not same. Each one permit |
| append-only      |     |      |     |          | some elements that other don't permit and reverse. xfs will have       |
|                  |     |      |     |          | implementation in futur.                                               |
+------------------+-----+------+-----+----------+------------------------------------------------------------------------+
| quotas           |  Y  |  Y   |  Y  |    Y     | Again "Y" is not aqual. ext3 accept quota only on data-journaled       |
|                  |     |      |     |          | filesystems, but all other journaled filesystem don't have data journal|
|                  |     |      |     |          | About reiserfs you need Chris patches.
+------------------+-----+------+-----+----------+------------------------------------------------------------------------+
| NFS              |  Y  |  Y   |  Y  |    Y     | nfs works on all of them. You need at least reiserfs v3.6.
+------------------+-----+------+-----+----------+------------------------------------------------------------------------+
| samba            |  Y  |  Y   |  Y  |    Y     | Since Samba is userspace, the fs shouldn't matter (2.2.4 or 2.2.5)     |
+------------------+-----+------+-----+----------+------------------------------------------------------------------------+
| coda             | coda is a file sys him self |            /               /              /              /             |
+------------------+-----+------+-----+----------+------------------------------------------------------------------------+
|data journal      |  N  |  Y   |  N  |    N     | Only ext3 can take care of data by a data journal. All other journaled |
|                  |     |      |     |          | file systems have "only" a metadata journal.                           |
+------------------+-----+------+-----+----------+------------------------------------------------------------------------+

--------------050600050304080100000904--

