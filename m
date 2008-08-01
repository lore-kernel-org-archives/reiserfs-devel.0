From: doiggl@velocitynet.com.au
Subject: iozone results
Date: Fri, 1 Aug 2008 23:38:49 +1000 (EST)
Message-ID: <13479.202.168.22.19.1217597929.squirrel@webmail.vel.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

iozone results
source info from http://www.citi.umich.edu/projects/asci/benchmarks.html

# iozone -ec -t 1 -r 4M -s 100M -+n -i 0 -i 1
        Iozone: Performance Test of File I/O
                Version $Revision: 3.300 $
                Compiled for 64 bit mode.
                Build: linux

        Contributors:William Norcott, Don Capps, Isom Crawford, Kirby Collins
                     Al Slater, Scott Rhine, Mike Wisner, Ken Goss
                     Steve Landherr, Brad Smith, Mark Kelly, Dr. Alain CYR,
                     Randy Dunlap, Mark Montague, Dan Million,
                     Jean-Marc Zucconi, Jeff Blomberg, Benny Halevy,
                     Erik Habbinga, Kris Strecker, Walter Wong, Joshua Root.

        Run began: Fri Aug  1 23:30:32 2008

        Include fsync in write timing
        Include close in write timing
        Record Size 4096 KB
        File size set to 102400 KB
        No retest option selected
        Command line used: iozone -ec -t 1 -r 4M -s 100M -+n -i 0 -i 1
        Output is in Kbytes/sec
        Time Resolution = 0.000001 seconds.
        Processor cache size set to 1024 Kbytes.
        Processor cache line size set to 32 bytes.
        File stride size set to 17 * record size.
        Throughput test with 1 process
        Each process writes a 102400 Kbyte file in 4096 Kbyte records

        Children see throughput for  1 initial writers  =  220451.12 KB/sec
        Parent sees throughput for  1 initial writers   =  218488.69 KB/sec
        Min throughput per process                      =  220451.12 KB/sec
        Max throughput per process                      =  220451.12 KB/sec
        Avg throughput per process                      =  220451.12 KB/sec
        Min xfer                                        =  102400.00 KB

        Children see throughput for  1 readers          =  749124.19 KB/sec
        Parent sees throughput for  1 readers           =  734250.46 KB/sec
        Min throughput per process                      =  749124.19 KB/sec
        Max throughput per process                      =  749124.19 KB/sec
        Avg throughput per process                      =  749124.19 KB/sec
        Min xfer                                        =  102400.00 KB
-----------
Here are some basic specifications:
- Opteron 2350
- Operating system (Opensuse 11) 64 bit on one disk. Reiser4 formatted on
another data disk(SATA)
- Disk formatted in the following way:

# mkfs.reiser4 -o create=ccreg40,compress=lzo1 /dev/sda -fy
# fsck.reiser4 --fix /dev/sda -y
# mkdir /reiser4
# mount -t reiser4 /dev/sda /reiser4

Glenn

