From: Sandor Laza <slaza@xs4all.nl>
Subject: Mount hangs on reiserfs filesystem
Date: Thu, 17 Feb 2005 18:27:37 +0100
Message-ID: <200502171827.37960.slaza@xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I had a PC with SuSE 9.0 installed with one reiserfs partition and one swap 
partition.  The processor died, so I decided to move the hard drive to an 
otehr PC with SuSE 9.2, to access the data.

But when I try to mount the partition, mount hangs and the whole system slows 
down.  I can't even kill mount anymore.

Here is what I tried:  

I checked the filesystem with reiserfsck --check.  No problem reported but  
mount hangs.
Rebuilt the whole filesystem with reiserfsck -S  /dev/hdc2  This identified 
some problems, and fixed it, but mount still hangs.

Then I created an ext2 filesystem to replace the swap drive.  Worked 
perfectly.
Then I created a reiserfs  filesystem on the same place.  When I wanted to 
mount this new filesystem, mount hung again.

Created a ext2 again, it worked...

One more twist: I am using reiserfs on the main hard drive of the system, and 
that is working perfectly.

At this moment, I am out of ideas. Any help would be highly appreciated!


Thanks,


Sandor
