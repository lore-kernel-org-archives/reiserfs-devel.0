From: Heinz-Josef Claes <hjclaes@web.de>
Subject: How to build a big file server
Date: 05 Jun 2003 10:14:13 +0200
Message-ID: <1054800852.1997.15.camel@wusel.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14405-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I did't found information about my problem on namesys, so I try to ask
here.

I plan to build a big fileserver for Deutscher Bundestag (German
Parliament) who is converting to linux on the server side. In the
beginning it will be used in a testing environment and later multiple of
them in production use.

Here are some questions:

- I plan to build a system with IDE 250GB drives. 7 of them for raid 5
and one hot spare. The OS will be on separate hardware raid 1 on smaller
disks. Does anybody have experience with IDE controlers for the big
disks? Is it better to use hardware raid oder software raid
(performance)?

- At this time, we plan to use reiserfs. What are the advantages /
disadvantages of using the raid 1 for journaling for the (big) raid 5
(performance, recovery)? The system will be heavily used with
storebackup (www.sf.net/projects/storebackup) witch means that lots of
hard links have to be created as fast as possible.

- BTW: I'm using a ZIP drive on the parallel port with reiserfs. Does it
make sense to put the journal for the ZIP drive on the hard disk of the
laptop?

Thanks for taking your time,
Heinz-Josef Claes


