From: Robert_Thilsted@ord.uscourts.gov
Subject: Re: Lost Files
Date: Wed, 29 Oct 2003 07:28:45 -0800
Message-ID: <OF0830F813.28F95302-ON88256DCE.00542FCD@uscmail.uscourts.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15933-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com






I have 40+ servers with 18 to 500Gig partitions, hardware and software =
RAID
1 and 5, Pentium III - Pentium 4 - AMD Opteron, 1 to 4 processors, and =
all
running SuSE 8.2 (moving to 9.0) using reiserfs.  I have never had a ca=
se
of data corruption or loss in the last two years.  Your problem could b=
e
hardware but the first thing I would do is to try SuSE 9.0.  From my
experience, definitely not normal.



|---------+---------------------------->
|         |           "Alexander       |
|         |           Waller"          |
|         |           <a.waller@webpoin|
|         |           t.at>            |
|         |                            |
|         |           10/29/03 01:06 AM|
|         |                            |
|---------+---------------------------->
  >--------------------------------------------------------------------=
-------------------------------------------|
  |                                                                    =
                                           |
  |       To:       <reiserfs-list@namesys.com>                        =
                                           |
  |       cc:       <webmaster@webpoint.at>                            =
                                           |
  |       Subject:  Lost Files                                         =
                                           |
  >--------------------------------------------------------------------=
-------------------------------------------|




Hi !
Yesterday it was the third time I lost important files on a
reiserfs-partition.
This time I had a reasonable backup.
So i could minimize the time my server was offline.
I use S.u.S.E 8.2.
The first to times reiserfsck was not able to repair any file. I found =
all
of them in the directory /lost+found, but that was not good for me. ( 1=
1000
files there )
This time about 5000 files were in /lost+found and the rest in the righ=
t
place.

Is this a normal behavior or do you think I have a hardware problem ?
Is the S.u.S.E implementation wrong ?
Shall I change to ext3 ? ( It=B4s slower, I know )

Whats the right strategie to recover a defetive partition ?

Alex.


--

WebPoint Internet Solutions
Alexander Waller
Vorarlberger Wirtschaftspark
A-6840 G=F6tzis

www.webpoint.at
tel.  +43 5523 58244
fax.  +43 5523 58255
mobil +43 676 4121128

webmaster-team  : webmaster@webpoint.at
hostmaster-team : hostmaster@webpoint.at

***                                     ***
*       WebPoint Internet Solutions       *
***                                     ***



=


