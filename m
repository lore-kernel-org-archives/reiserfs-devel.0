From: Kurt <kpalmer@advance.net>
Subject: Filesystem Corruption
Date: Thu, 06 Jun 2002 18:00:01 +0000
Message-ID: <85256BD0.00676692.00@patapsco.com>
Reply-To: kpalmer@advance.net
Mime-Version: 1.0
Content-Type: multipart/mixed;
 Boundary="0__=36QayKme3XQdcvvCn66Ljf1vTNMsVBh2K4fnqmEzECmVBDmVnNDVSlrm"
Return-path: <reiserfs-list-return-10625-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--0__=36QayKme3XQdcvvCn66Ljf1vTNMsVBh2K4fnqmEzECmVBDmVnNDVSlrm
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline

                                                                  
 (Embedded                                                        
 image moved   Kurt <kpalmer@advance.net>                         
 to file:      06/06/2002 02:00 PM                                
 pic19921.pcx)                                                    
                                                                  








 (Embedded
 image moved   Kurt <kpalmer@advance.net>
 to file:      06/06/2002 02:00 PM
 pic06540.pcx)









 (Embedded
 image moved   Kurt <kpalmer@advance.net>
 to file:      06/06/2002 02:00 PM
 pic08003.pcx)









 (Embedded
 image moved   Kurt <kpalmer@advance.net>
 to file:      06/06/2002 02:00 PM
 pic04883.pcx)









 (Embedded
 image moved   Kurt <kpalmer@advance.net>
 to file:      06/06/2002 02:00 PM
 pic11654.pcx)









 (Embedded
 image moved   Kurt <kpalmer@advance.net>
 to file:      06/06/2002 02:00 PM
 pic24262.pcx)









 (Embedded
 image moved   Kurt <kpalmer@advance.net>
 to file:      06/06/2002 02:00 PM
 pic13835.pcx)








Hello all,
     I currently have a system configured as follows :-
1) LVM version 1.0.1-rc4(ish)(03/10/2001)
2) /dev/PROJ/proj on /proj type reiserfs (rw,noatime,notail)
3) /dev/PROJ/proj        239G  142G   97G  60% /proj
4) 2.4.17 with reiserfs tools 3.x.0k
5) Reiserfs compiled in (CONFIG_REISERFS_CHECK set to NO)
6) 256 MB RAM ("sar -r" shows memory usage is not abnormal for this box)
7)Tuns of very small files based on log processing
I am told by my co-worker that the system unresponsive and showed reiserfs
related errors on the console.
Upon restart they noticed that the file
/proj/webtrends/receive/bama/www3/access.01Jun.r.gz was unreadable by root
(permission denied).
I did a reiserfsck on the drive and noticed that access.01Jun.r.gz returned an
error stating the file pointed to nowhere.
I was unable to complete a reiserfsck --fix-fixable because of the length of
time that this (fsck) process took since this was an unscheduled downtime.
During the weekend i will attempt to do the fsck again, however i really
needed to know if this problem has been observed by anyone else, and what
steps they took to fix the problem.
-Kurt



--
================================================
Kurt Palmer                                      SysAdmin
kpalmer@advance.net                Advance Internet
201-459-2846

--0__=36QayKme3XQdcvvCn66Ljf1vTNMsVBh2K4fnqmEzECmVBDmVnNDVSlrm--

