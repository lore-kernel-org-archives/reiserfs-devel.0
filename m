From: Martin Wilck <Martin.Wilck@Fujitsu-Siemens.com>
Subject: is_tree_inode: node level X does not match to the expected one Y
Date: 15 Sep 2003 13:43:19 +0200
Message-ID: <1063626200.12910.347.camel@biker.psw.pdb.fsc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15668-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiser FS Mailing List <reiserfs-list@namesys.com>


Hi,

We are currently trying to debug an error that occurs only with
ReiserFS. The error occurs during a high-IO-load stress test
(copy/compare test).

Sep  8 19:20:55 rx203 kernel: vs-13050: reiserfs_update_sd: \
   i/o failure occurred trying to update [12 56 0x0 SD] stat data\
   is_tree_node: node level 2 does not match to the expected one 3
Sep  8 19:20:55 rx203 kernel: vs-5150: search_by_key: \
   invalid format found in block 13924. Fsck?

[line breaks with \ inserted by me]

From reading the code it appears to me that the call sequence is
reiserfs_update_sd()->search-by_key()->is_tree_node(), so that
"node level 2 does not match to the expected one 3" is the "real"
error messages and the others are just follow-ups.

The kernel in use is SuSE 8.1 errata kernel 2.4.19, release 340.
IO is on an Adaptec U320 SCSI controller with the aic79xx driver 1.3.10
(saw the same problem with earlier versions of the driver, and other
SuSE kernels, too).

Interestingly, when I stop test, unmount the volumes and do a
reiserfsck, no errors are reported, the file systems seem to be intact.

It is likely that we are facing hardware problems here, but there are
also some facts suggesting the contrary:

- no driver error messages, no SCSI IO errors
- same test with ext2 runs flawlessly for >24h, whereas with Reiser the
above errors occur typically after 2-3h.

My Questions:

- is it possible that this is _not_ a hardware error, but a reiser
  problem?

- can anyone give me a hint as to what sort of hardware errors to look 
  for?

- can anybody give me a simple explanation what is actually going wrong
  in the situation at hand?

- It appears that some Reiser metadata are read incorrectly (although
  they are ok on disk). Does it make sense that a hardware error would
  cause _right these_ meta data (node level) wrongly but get all the
  rest right? If yes, are there any possible conclusions  wrt to the 
  type of error?

Thanks,
Martin


-- 
Martin Wilck                Phone: +49 5251 8 15113
Fujitsu Siemens Computers   Fax:   +49 5251 8 20409
Heinz-Nixdorf-Ring 1	    mailto:Martin.Wilck@Fujitsu-Siemens.com
D-33106 Paderborn           http://www.fujitsu-siemens.com/primergy





