From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: [benchmark] seek optimization
Date: Wed, 14 Jul 2004 15:52:11 +0200 (MEST)
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0407141345040.29248-100000@mlf.linux.rulez.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: reiserfs-list@namesys.com, linux-ntfs-dev@lists.sourceforge.net, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Per Olofsson <pelle@dsv.su.se>


Hello,

The test below wasn't intended to be a comprehensive evaluation of
filesystems' seek optimizations. The test method, as most others, might be
synthetic, nevertheless the tool used for the evaluation is also used to
solve real problems. But please don't make too general conclusions, if any
at all ;-)

Four set of tests were done: both cloning and imaging a large, fragmented
filesystem on both 2.4 and 2.6 kernels. The block allocation bitmap is
read and blocks in use are either copied to the exact places in a sparse
file (cloning) or the entire filesystem is streamed into an image where
the unused blocks are encoded (imaging). Considering strictly the output,
imaging requires no seek meanwhile the number of seeks could be optimized
to 0 during cloning.

Ntfsclone was chosen for the experiment, it can both clone and image into
a file. The source partitions was 8 GB and had 5 GB data scattered around.
The filesystems were always freshly recreated on the destination
partition. Both partitions were on the same disk. There were 3 runs for
each case, average taken. Deviation from average was always less then
0.5%. Sync()'s were always counted at the end of the runs.

In the below table "seek" refers to the cloning process, "noseek" to the
imaging. The "24" means 2.4.26 kernel ont the SystemRescueCD 0.2.14 and
"26" means 2.6.7 kernel on RIP 10.3. The "raw" means simple cloning
between two partitions (no filesystem on the destination partition).

The theoretical best result for 2.4 kernel is around 7:43 and for 2.6
kernel is around 8:05 minutes.

Results,

Fs_kernel_method      usr      sys       real   CPU
jfs_24_noseek        1.74    23.17    7:50.56    5%
reiser4_26_seek      1.81    36.66    8:06.12    7%
reiser4_26_noseek    2.02    46.75    8:08.72    9%
xfs_24_noseek        1.84    23.61    8:14.44    5%
ext2_24_noseek       1.58    20.92    8:15.28    4%
jfs_26_noseek        1.89    33.33    8:15.76    7%
ext2_24_seek         1.97    17.50    8:15.98    3%
raw_24_seek          1.65    17.88    8:17.69    3%
ext2_26_noseek       1.86    31.92    8:19.59    6%
xfs_26_noseek        1.92    33.70    8:20.48    7%
xfs_24_seek          1.72    20.77    8:25.17    4%
ext3_24_noseek       1.69    32.62    8:26.21    6%
raw_26_seek          1.80    33.49    8:27.02    6%
ext2_26_seek         1.80    29.77    8:27.29    6%
reiserfs_26_noseek   1.98    51.19    8:29.79   10%
reiserfs_26_seek     1.85    41.14    8:30.26    8%
ext3_24_seek         1.55    23.48    8:35.42    4%
xfs_26_seek          1.76    34.10    8:36.17    6%
ext3_26_noseek       1.92    39.83    8:37.38    8%
ext3_26_seek         1.84    35.55    8:43.41    7%
reiserfs_24_seek     1.71    28.20    8:50.02    5%
reiserfs_24_noseek   1.97    43.98    9:03.43    8%
jfs_24_seek          1.76    31.11   11:34.68    4%
jfs_26_seek          1.48    36.46   14:23.51    4%

Many interesting things can be noticed, I'd mention only two.

  1. For this type of workload, 2.6 kernels clearly perform worse 
     than 2.4 kernels.

  2. Reiser4's seek optimization is astonishing! It hits the problem
     in the 2.6 kernels, that's its bottleneck. Apparently it also 
     optimized away all (or most of) the seeks: the theoretically seek
     intensive run is faster than its seekless equivalent. How could 
     this be possible? If there were no (significant number of) seeks
     then the seekless version has a minor overhead. The Reiser4 result 
     just shows this! Amazing!!!

Cheers,
	Szaka

