From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Reiser4 too fragile..?
Date: Thu, 3 Mar 2005 15:09:57 +0200
Message-ID: <200503031509.57890.rmeijer@internet.gr>
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

Hiya,

I just converted all the Reiser4 partitions on my desktop back to 
ReiserFS after spending most of the morning on fixing my /usr once 
again...

Nearly every time my machine crashed the past year or so (which doesn't 
happen often) it left my Reiser4 partitions (/usr in particular) 
riddled with file system errors.

This morning, after a crash, reboot and fsck, I found many files 
from /usr in /usr/lost+found and I was forced to reinstall many 
packages.

After that I decided to get it over with and reformatted all my 
partitions. From now on I will use Reiser4 for testing purposes only 
until it's more stable.

Why is it that Reiser4 file systems get damaged badly (--fix --build-fs 
etcetera) when a kernel panic occurs and ReiserFS file systems survive 
just fine?

Almost always after an unexpected reboot I had to fsck my Reiser4 file 
systems to fix errors. Running reiserfsck on my ReiserFS file systems 
NEVER found any errors...

Any ideas?


Thanks,

Ray
