From: Phil Howard <phil-reiserfs@ipal.net>
Subject: Re: copying partition to partition, sector by sector, live
Date: Mon, 22 Apr 2002 18:24:48 -0500
Message-ID: <20020422232448.GE8407@vega.ipal.net>
References: <20020421181614.GA11239@vega.ipal.net> <20020422010733.GA2379@amphibian.dyndns.org> <20020422013955.GB8407@vega.ipal.net> <20020422224755.GA1710@amphibian.dyndns.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10132-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020422224755.GA1710@amphibian.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Toseland <mtoseland@blueyonder.co.uk>
Cc: reiserfs-list@namesys.com

On Mon, Apr 22, 2002 at 11:47:55PM +0100, Matthew Toseland wrote:

| On Sun, Apr 21, 2002 at 08:39:55PM -0500, Phil Howard wrote:
| > On Mon, Apr 22, 2002 at 02:07:33AM +0100, Matthew Toseland wrote:
| > 
| > | Ummm, LVM snapshots? (man lvcreate).
| > 
| > No.  Nothing to do with LVM.
| I was suggesting a solution. Your problem is that reiserfs's metadata is
| so dynamic that if you copy the partition while it is active, you end up
| with metadata loss, which has to be fixed by reiserfsck. A possible
| solution is to get a consistent snapshot. To do this, do:
| 
| lvcreate -n <snapshotname> -L 500M -v /dev/<vgname>/<partition name>
| dd if=/dev/<vgname>/snapshotname of=/usr/local/temp/snapshot.img bs=1M
| lvremove -f /dev/<vgname>/snapshotname
| 
| (1) 500M could be anything; it is the amount of space needed to log all
| changes to the partition while the dd is going on; you can extend it later
| but once it fills up completely, you're scr00d; presumably the dd will
| return an error

Sounds like journaling at the sector level.

How does all that change get replayed after the snapshot is done?

I'm starting to think it might be better to go back to using rsync on
mounted filesystems.

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://phil.ipal.org/     |
-----------------------------------------------------------------
