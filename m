From: Steven Cole <elenstev@mesatop.com>
Subject: Re: Results of "bk clone" tests with 2.6.2,  reiser4, reiserfs,
	ext3, xfs and jfs
Date: Wed, 11 Feb 2004 11:48:39 -0700
Message-ID: <1076525319.1683.44.camel@spc.esa.lanl.gov>
References: <1076456354.1585.36.camel@spc.esa.lanl.gov>
	 <402A5468.3000609@namesys.com>  <200402110232.54727.elenstev@mesatop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16765-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402110232.54727.elenstev@mesatop.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, nikita@namesys.com

On Wed, 2004-02-11 at 02:32, Steven Cole wrote:
> On Wednesday 11 February 2004 09:12 am, Hans Reiser wrote:
> > Steven Cole wrote:
> > >I used the "-o key=key_short" option when creating the
> > >reiser4 file system due to getting this message:
> > >"kernel: WARNING: Key format mismatch. Only small keys are supported."
> >
> > This might have hurt our performance substantially.  Did you
> > intentionally choose small keys?  If not, Nikita, why did this happen?
> 
> Well, intentionally _only_ because it seemed the reasonable thing to do
> in the face of the above warning message.  Tomorrow, I can recompile
> the reiser4-enabled kernel with the large keys option and mkfs.reiser4
> again without that key_short option.  I'll let you know if there are any interesting
> results.
> 
> Steven

OK, tomorrow came a day early this week.

I recompiled the 2.6.2 reiser4 kernel with CONFIG_REISER4_LARGE_KEY=y,
rebooted, and created a reiser4 fs without the key_small option as before.

I repeated the tests using the same bk tree and got very similar results
to using short keys.

After that, I umounted and did a fsck.reiser4 and got many errors,
"12463 fixable corrections".  I repeated fsck.reiser4 with --fix, and
the errors were fixed. (No corruption found)

I then mounted the fs again, created another clone, ran "bk -r check -acv"
on the new clone, and that test passed with no errors.  I then ran fsck again, and
it reported 2080 fixable corrections, which were fixed with a following
fsck.reiser4 --fix /dev/sda9.

[root@spc2 steven]# mount -t reiser4 /dev/sda9 /r4_testing
[root@spc2 steven]# df -T
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda1     ext3      798476    155108    602808  21% /
/dev/sda8     ext3     7147260   3548360   3235836  53% /home
none         tmpfs      257332         0    257332   0% /dev/shm
/dev/sda6     ext3     4024188   1871100   1948664  49% /usr
/dev/sda7     ext3      806368     61504    703900   9% /var
/dev/sda9  reiser4     3930680       288   3930392   1% /r4_testing


[steven@spc2 r4_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_1-2.6
58.97user 37.55system 2:05.34elapsed 77%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (1major+176404minor)pagefaults 0swaps
[steven@spc2 r4_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_2-2.6
59.29user 38.55system 2:15.31elapsed 72%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (1major+176404minor)pagefaults 0swaps
[steven@spc2 r4_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_3-2.6
59.27user 38.29system 2:13.40elapsed 73%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (1major+176404minor)pagefaults 0swaps
[steven@spc2 r4_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_4-2.6
59.22user 38.08system 2:14.81elapsed 72%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (2major+176403minor)pagefaults 0swaps
[steven@spc2 r4_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_5-2.6
59.15user 38.42system 2:14.20elapsed 72%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (3major+176402minor)pagefaults 0swaps
[steven@spc2 r4_testing]$ df -T
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda1     ext3      798476    155104    602812  21% /
/dev/sda8     ext3     7147260   3548360   3235836  53% /home
none         tmpfs      257332         0    257332   0% /dev/shm
/dev/sda6     ext3     4024188   1871100   1948664  49% /usr
/dev/sda7     ext3      806368     61504    703900   9% /var
/dev/sda9  reiser4     3930680   1208876   2721804  31% /r4_testing

I then umounted the reiser4 partition and ran fsck.reiser4 on it,
and got lots of the following:

Error: Node (50123), item (11): StatData of the file [14d9e:732e7573627175:14da6] has the wrong bytes (35872),
Should be (36864). Plugin (stat40).
        Time interval: Wed Feb 11 11:08:35 2004 - Wed Feb 11 11:10:43 2004
***** fsck.reiser4 finished at Wed Feb 11 11:10:43 2004
Closing fs...done

12463 fixable corruptions were detected in the FileSystem. Run with --fix option to fix them.

[root@spc2 /]# /usr/local/sbin/fsck.reiser4 --fix /dev/sda9
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read REAMDE first.
*******************************************************************

Fscking the /dev/sda9 block device.
Will fix minor corruptions of the Reiser4 SuperBblock.
Will fix minor corruptions of the Reiser4 FileSystem.
Continue?
(Yes/No): yes
***** Openning the fs.
Reiser4 fs was detected on the /dev/sda9.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.5.0
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x4b822079
blocks:         1034176
free blocks:    731967
root block:     293783
tail policy:    0x4 (smart)
next oid:       0x2d287
file count:     119341
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.

After many messages, fsck reported "No corruption found".

Steven

