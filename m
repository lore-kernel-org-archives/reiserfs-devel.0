From: nobody@nowhere.invalid (Unknown)
Subject: Bug in reiserfsck 3.6.1-pre1
Date: Mon, 16 Sep 2002 02:56:55 +0200
Message-ID: <20020916025655.E22362@noris.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11456-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Resent-Message-ID: <3D852E10.28754.qmail@gemini.noris.de>
Content-Disposition: inline
Resent-To: reiserfs-list@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Pass 2:

# reiserfsck --rebuild-tree -S /dev/md0

...
0%..rewrite_file: 2 items of file [97373 97385] moved to [97373 1591], 207
/sec
..20%....40%..vpf-10260: The file we are inserting the new item (89 280
0x120001 IND (1), len 4048, location 48 entry count 0, fsck need 0, format
new) into has not StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (89 280 0x514001 IND
(1), len 4048, location 48 entry count 0, fsck need 0, format new) into
has not StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (89 280 0x908001 IND
(1), len 4048, location 48 entry count 0, fsck need 0, format new) into
has not StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (2035 3072665 0x10b001
IND (1), len 1060, location 3036 entry count 0, fsck need 0, format new)
into has not StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (2035 3072665 0x10b001
IND (1), len 1060, location 3036 entry count 0, fsck need 0, format new)
into has not StatData, insertion was skipped
ufile.c 171 delete_N_items_after_key
delete_N_items_after_key: No directory item of [32340 32341] are expected
Aborted

I needed the rebuid because I had a multiple RAID disk death.

I restarted the check; if it dies again I'll append a core dump.

-- 
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
