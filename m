From: Javier Marcet <jmarcet@pobox.com>
Subject: Undeleting a whole reiserfs partition
Date: Mon, 5 Aug 2002 22:47:19 +0200
Message-ID: <20020805204719.GE14745@jerry.boludo.cjb.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11123-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Yesterday, by error, a 'rm -fr' slipped through to my /music partition,
a 20GB reiserfs which was at arounf 85% full. SInce then no other
activity took place on it. Is there any easy way to recover my files?

In the docs, it says you cannot undelete files in reiserfs partitions,
since what you delete is most probable overwritten by the next comitted
data. In my case, there has been no additional modification of the
partition, though.

