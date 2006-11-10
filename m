From: PagCal <pagcal@runbox.com>
Subject: softlink created across different partitions
Date: Fri, 10 Nov 2006 04:35:44 -0500
Message-ID: <455447F0.4030501@runbox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30129-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I'm running SUSE 10.1 with your reiser fs on two partitions.

I created a directory, with files, on one partition, but wanted to move
that directory and files to another partition, so I did

    # go to one partition
    cd /home
    # try to move directory and files from this partition to another
partition
    mv dot-xyz /root/.xyz

The files never moved, and now I've got some sort of soft link existing
on the /home partition into the / partition. I can't delete the softlink
either. Yes, I can 'rm' the link, but somehow, if I tar into dot-xyz,
files end up on /root/.xyz.

I've run your latest released fsck and it finds no problems.

What are my options?
