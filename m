From: Julian Picht <JPicht85@web.de>
Subject: data loss with reiserfs
Date: Fri, 21 Jun 2002 19:21:37 +0200
Sender: JPicht85@web.de
Message-ID: <200206211920.38534.JPicht85@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10783-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello!

I've got SuSE 8.0 Pro installed on reiserfs version 3.x.1b.
About a week ago my /var/ folder was empty. I know that it wasn't deleted=
 by=20
any user the files and subfolders where just gone. The content in the /va=
r/=20
directory was not that important but today the content of another directo=
ry=20
vanished including some files I need.
The files vanished today where about 1.5 GB but this space is _not_ free.=
 So=20
the files aren't there but they are also not realy gone.
I first thought I could have exidentaly moved them but I cannot "locate" =
them.=20
[Yes I did "updatedb"]
So i wanted to do "reiserfsck" but when I mounted the drive read/write it=
 said
----------------------
reiserfsck 3.x.1b (2002)
Will read-only check consistency of the filesystem on /dev/hdb3
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Fri Jun 21 19:13:18 2002
###########
Device /dev/hdb3 is mounted w/ write permissions, can not check it
----------------------
When I mounted it read only it said the same, also when I did not mount t=
he=20
device at all: the same message.

So, what can I do?

greetings Julian Picht
