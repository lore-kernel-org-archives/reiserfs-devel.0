From: berthiaume_wayne@emc.com
Subject: fsync() Performance Issue
Date: Fri, 26 Apr 2002 16:28:26 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049BF961@corpusmx1.us.dg.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C1ED60.EB9F6620"
Return-path: <reiserfs-list-return-10194-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------_=_NextPart_000_01C1ED60.EB9F6620
Content-Type: text/plain;
	charset="iso-8859-1"

	I'm wondering if anyone out there may have some suggestions on how
to improve the performance of a system employing fsync(). I have to be able
to guaranty that every write to my fileserver is on disk when the client has
passed it to the server. Therefore, I have disabled write cache on the disk
and issue an fsync() per file. I'm running 2.4.19-pre7, reiserfs 3.6.25,
without additional patches. I have seen some discussions out here about
various other "speed-up" patches and am wondering if I need to add these to
2.4.19-pre7? And what they are and where can I obtain said patches? Also,
I'm wondering if there is another solution to syncing the data that is
faster than fsync(). Testing, thusfar, has shown a large disparity between
running with and without sync.Another idea is to explore another filesystem,
but I'm not exactly excited by the other journaling filesystems out there at
this time. All ideas will be greatly appreciated.

Wayne
EMC Corp
Centera Engineering
4400 Computer Drive
M/S F213
Westboro,  MA    01580

email:       Berthiaume_Wayne@emc.com
voice:       (508) 898-6564
pager:     (888) 769-4578  (numeric)
                8007208398.9801155@pagenet.net  (alpha)
fax:          (508) 898-6388

"One man can make a difference, and every man should try."  - JFK

 <<Wayne Berthiaume (E-mail).vcf>> 

------_=_NextPart_000_01C1ED60.EB9F6620--
