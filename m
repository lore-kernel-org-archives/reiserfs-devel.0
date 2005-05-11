From: Alexander Gruber <alex@gruber.cn>
Subject: disk runs full
Date: Thu, 12 May 2005 00:15:48 +0200
Message-ID: <42828414.1070701@gruber.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24040-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi together,

since several weeks the root partition (of course reiserfs, v3.6)  of 
our webserver runs slowly full although there are not enough files on 
the disk to fill up all the space. After a reboot everything is fine again!
I already searched google and the mail archive but the only hint i found 
was about open files but lsof shows not even one opened file on the root 
partition. Of course /var /home etc. are on different partitions.

Please help me!

Regards

Alex
