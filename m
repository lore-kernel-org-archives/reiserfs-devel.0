From: Nicolas Vanderavero <nv@info.ucl.ac.be>
Subject: "Unformat" a ReiserFS partition : a testimony :-)
Date: Mon, 24 Mar 2003 20:36:19 +0100
Message-ID: <3E7F5E33.4020709@info.ucl.ac.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13355-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

while reinstalling a Debian on a new hard drive, I made the mistake to 
format in reiserfs my good old /home which was on /dev/sda7 instead of 
formatting the new /dev/hda7. Gasp ! Eight gigabytes lost ...

Or ... maybe it was not totally lost :-) I immediately made a dump of 
the partition with 'dd' and started grepping some known text on it. It 
seemed that no data was really lost. I didn't know what to do. So I read 
the man pages and found the reiserfsck command quite interesting :-)

Ok, I am a total newbie to filesystems and to ReiserFS. So maybe it will 
sound trivial to you, but just in case it happens to anyone else, I just 
wanted to say that running a reiserfsck --rebuild-tree -S on my 
partition was enough to unformat it. I ended up with some file in 
lost+found, but a 'file *' is enough to discover what they are.

So, maybe it would be usefull to add an entry in the "Example of using" 
section of the man page of reiserfsck, saying something like : "If you 
reformatted by mistake a reiserFS partition, you can try to unformat it 
by running reiserfsck --rebuild-tree -S on it".

Anyway, thank you for developing this filesystem.
Nicolas Vanderavero.




