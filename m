From: Laurent CARON <lcaron@apartia.fr>
Subject: ReiserFS 3.6 - Unable to access some files
Date: Tue, 20 Dec 2005 16:09:40 +0100
Message-ID: <43A81EB4.8080907@apartia.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27459-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I'm currently using a big (1.2Tb) Reiser3.6 filesystem under debian SID 
(Kernel 2.6.13).

Problem: I'm trying to delete a file, but unfortunately.... it won't me 
delete it.

server:/var/tmp# rm -Rf network.old
rm: cannot remove `network.old/Makefile': Permission denied

cd ./network.old
server:/var/tmp/network.old# ls -al
ls: Makefile: Permission denied
total 0
drwxrwxrwt+ 2 root Domain Users  72 2005-07-13 10:17 ./
drwxrwxrwt  4 root root         104 2005-12-02 13:42 ../

server:/var/tmp/network.old# stat *
stat: cannot stat `Makefile': Permission denied


Is this a filesystem corruption, a bug in reiserfs....?

Thanks
