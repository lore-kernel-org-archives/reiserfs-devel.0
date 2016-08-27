From: <doiggl@velocitynet.com.au>
Subject: Are there any tools/code to re-size a reiser4 volume ? [sdb]
Date: Sat, 27 Aug 2016 10:47:23 +1000
Message-ID: <f37fae4c55d4a7bdebe88780be7df8da@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

Is their any code or tools available to list the 'last' used block on a
reiser4 volume.
Code to walk the tree of files and find last used block [list block
number]

The reason I ask is 57% unused space on volume so [100% - 43% used = 57%
unused]

- To  allow resizing of a reiser4 volume, ['last' used block allocated to
a file + 1 ]
- Is that possible and safe to do so ?
- Frees up a lot of the allowable space [ 1.8T - 747G used]
- Are there any tools/code to re-size a reiser4 volume ?

Thanks
--Glenn

df -h shows:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdb        1.8T  747G  1.0T  43% /media/disk

mount shows
# time mount /dev/sdb  /media/disk

real    1m50.414s
user    0m0.012s
sys     0m1.844s
