From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: serious data corruption when doing "mount -o remount,ro /"
Date: Mon, 13 Sep 2004 13:16:37 +0200
Message-ID: <41458195.8080506@dermichi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21710-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

After running reiser4 as / filesystem for some time i got a serious 
problem yesterday. In short: the FS didn't survive a "mount -o 
remount,ro /". Here is what I did:
# init 1
# mount -o remount,ro /
# fsck.reiser4 /dev/hda7
fsck complained about not finding the root directory and said that the 
tree height of 4 was incorrect because it should be 255. I thought this 
would be a temporary problem as i had worked with my system until 30 
seconds before without a problem. So i rebooted, which was really not a 
good idea. The FS was unmountable after that. After running fsck from a 
livecd to repair the FS, which took about 2 hours, the FS was restored 
almost completely, but then i went back to a backup to be safe.
I am still able to reproduce random corruption by doing a remount ro. I 
also get this problem if i use the "magic sysreq key" to do the remount. 
If i remount the FS rw again and shutdown after that the FS does NOT get 
corrupted at all.
I am not posting details about my system since i was able to get the 
same corruption on two completely different systems. Also i'm not 
including fsck output as the corruption is random and reports different 
things every time.
Any ideas what could be causing this?

Michael
