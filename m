From: Faraz S <farazs@calsoftinc.com>
Subject: Comments about indexing and query solving in user land
Date: Mon, 06 Sep 2004 14:32:34 +0530
Message-ID: <19592.4152424142$1094461530@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21504-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

Hi;
	With the hot debate on the linux kernel mailing list about what
features must be in the kernel, i'd like to add my experience about
keeping the query parser in the userspace. 

	In our project http://sourceforge.net/projects/linuxsfs-tm/ we did the
attribute indexing and query parsing in the user-space and we had hooks
in the VFS which communicated with the user-space deamons. As far as
directory listing is concerned we had a in kernel-recordset cache
(hashed on the query). The listing were pretty efficient.

	But the real problem occured when a large number of files were copied
in the onto our file system. All the files now need to be indexed in the
user space , leading to mode switch. That was pathetically slooow. The
entire 2.4 sources were copied in 5-6 hours. I think this problem could
be solved by batching requests the user space deamon.  Then u have all
the problems on missing out on indexing on a large set of files.
	
	No doubt the feature which did content based listing was very well
recieved by the audience of the project. I will soon be uplaoding the
project documentation and PPT's. 

WE NEED THIS FOR SURE - BUT DONE IN THE RIGHT WAY

regards.

-- 
Faraz Ahmed Shaikh
Member Technical Staff
Calsoft Pvt Limited

