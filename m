From: <doiggl@velocitynet.com.au>
Subject: using debugfs.reiser4 options to access R4 on /dev/sdb
Date: Wed, 25 Feb 2015 01:24:36 +1100
Message-ID: <2a39c4776614cb7a675f299083a3627a@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Are there any switches with using 'debugfs.reiser4' to help using mount or
print details on R4 disk/partition. Im trying get to access /dev/sdb
Thanks Glenn

/dev/sdb problem encountered:
============================
http://www.spinics.net/lists/reiserfs-devel/msg04665.html

# which debugfs.reiser4                                                   
                                                                         
/usr/sbin/debugfs.reiser4

# debugfs.reiser4 -V
debugfs.reiser4 1.0.9

#  debugfs.reiser4
Usage: debugfs.reiser4 [ options ] FILE
Browsing options:
  -k, --cat FILE                browses passed file like standard
                                cat and ls programs.
Print options:
  -s, --print-super             prints the both super blocks.
  -t, --print-tree              prints the whole tree.
  -j, --print-journal           prints journal.
  -d, --print-oid               prints oid allocator data.
  -a, --print-alloc             prints block allocator data.
  -b, --print-block N           prints block by its number.
  -n, --print-nodes FILE        prints all nodes file lies in.
  -i, --print-file FILE         prints all items specified file
                                consists of.
Metadata options:
  -P, --pack-metadata           fetches filesystem metadata and writes it
                                to standard output.
  -U, --unpack-metadata         uses metadata stream from stdandard input
                                to construct filesystem by it.
Space options:
  -O, --occupied-blocks         works with occupied blocks only(default).
  -F, --free-blocks             works with free blocks only.
  -W, --whole-partition         works with the whole partition.
  -B, --bitmap                  works with blocks marked in the bitmap
only.
Plugins options:
  -p, --print-profile           prints the plugin profile.
  -l, --print-plugins           prints known plugins.
  -o, --override TYPE=PLUGIN    overrides the default plugin of the type
                                "TYPE" by the plugin "PLUGIN" in the
                                profile.
Common options:
  -?, -h, --help                prints program usage.
  -V, --version                 prints current version.
  -f, --force                   makes debugfs to use whole disk, not
  -y, --yes                     assumes an answer 'yes' to all questions.
                                block device or mounted partition.        
                           
  -c, --cache N                 number of nodes in tree buffer cache
