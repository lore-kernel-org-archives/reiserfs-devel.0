From: Raphael Bosshard <whistler@fnord.ch>
Subject: windows ate my superblock (try 2)
Date: Wed, 25 Dec 2002 01:41:41 +0100
Message-ID: <3E08FEC5.2060608@fnord.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12246-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi there!

My little brother tried to install windows on my computer this morning 
("don't touch my linux-partitions" i told him) but he let windows eat 
them anyway. my reiserfs-data partition also. (scandisk checking and 
"repairing", only partly AFAIK, AFAIH)

Mount failed with:
mount: wrong fs type, bad option, bad superblock on /dev/hdb,
      or too many mounted file systems

so I tried a reiserfsck which resulted in a

reiserfs_open: neither new nor old reiserfs format found on /dev/hdd2
reiserfsck: could not open filesystem on "/dev/hdd2"

Some digging in the mailinglist pointed out that the superblock was 
destroyed, so I tried to rebuild it with:

reiserfsck --no-journal-available --rebuild-sb

reiserfsck now recognises the reiserfs-partition, but fails because 
there is no journal/wrong journal parameters.

(Filesystem with standard journal found, --no-journal-available is ignored
reiserfs_open_journal: wrong journal parameters found in the super block.)


Finaly my question: Is there a way to find out the right parameters and 
create a new journal?

Any help is appreciated, really. ;)
Happy new year!

Raphael

(Please CC me, I'm not on the list.) 

