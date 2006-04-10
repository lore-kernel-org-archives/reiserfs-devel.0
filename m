From: "Dan Sheffner" <dsheffner@gmail.com>
Subject: reiserfs max file test
Date: Mon, 10 Apr 2006 13:34:45 -0500
Message-ID: <bfe179c00604101134k4663c745qf39cb1d576db702d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_10149_1408206.1144694085828"
Return-path: <reiserfs-list-return-28465-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_10149_1408206.1144694085828
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello All,

I'm trying to find out the number of files that reiserfs can support in a
single folder.  I know that you web site says about 1.2 million files
without collision, but I have written a small program to create files in
order and so far I have been able to create about 10 million files in one
directory.  Can you explain collision more? Here is the program I used belo=
w
to test my theory.  I echo out hello 10 times to each file to give some
size. My linux distro is GENTOO 2006.0 version and I'm running kernel
2.16.15


#!/bin/bash

LIMIT=3D10000000 # Upper limit of 10 million files
echo
echo "creating $LIMIT files for test"
a=3D0

while [ $a -le "$LIMIT" ]
do
echo $a
a=3D$(($a+1))
touch /home/thesheff17/installServer/file/file$a.txt
echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt
echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt
echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt
echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt
echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt
echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt
echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt
echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt
echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt
echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt
echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt
done


Below is the find command that tells me how many files are in the
directory.

production / # find /home/thesheff17/installServer/file/ \! -type d | wc -l
10000001
production / #

------=_Part_10149_1408206.1144694085828
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hello All,<br></div>
<div>&nbsp;</div>
<div>I'm trying to find out the number of files that reiserfs can
support in a single folder.&nbsp; I know that you web site says about 1.2
million files without collision, but I have written a small program to
create files in order and so far I have been able to create about 10
million files in one directory.&nbsp; Can you explain collision more?&nbsp;=
Here
is the program I used below to test my theory.&nbsp; I echo out hello 10
times to each file to give some size. My linux distro is GENTOO 2006.0
version and I'm running kernel 2.16.15</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>#!/bin/bash <br><br>LIMIT=3D10000000 # Upper limit of 10 million files=
&nbsp;<br>echo <br>echo &quot;creating $LIMIT files for test&quot; <br>a=3D=
0 <br><br>while [ $a -le &quot;$LIMIT&quot; ] <br>do <br>echo $a <br>a=3D$(=
($a+1))=20
<br>touch /home/thesheff17/installServer/file/file$a.txt <br>echo &quot;HEL=
LO&quot; &gt;&gt; /home/thesheff17/installServer/file/file$a.txt <br>echo &=
quot;HELLO&quot; &gt;&gt; /home/thesheff17/installServer/file/file$a.txt=20
<br>echo &quot;HELLO&quot; &gt;&gt; /home/thesheff17/installServer/file/fil=
e$a.txt <br>echo &quot;HELLO&quot; &gt;&gt; /home/thesheff17/installServer/=
file/file$a.txt <br>echo &quot;HELLO&quot; &gt;&gt; /home/thesheff17/instal=
lServer/file/file$a.txt=20
<br>echo &quot;HELLO&quot; &gt;&gt; /home/thesheff17/installServer/file/fil=
e$a.txt <br>echo &quot;HELLO&quot; &gt;&gt; /home/thesheff17/installServer/=
file/file$a.txt <br>echo &quot;HELLO&quot; &gt;&gt; /home/thesheff17/instal=
lServer/file/file$a.txt=20
<br>echo &quot;HELLO&quot; &gt;&gt; /home/thesheff17/installServer/file/fil=
e$a.txt <br>echo &quot;HELLO&quot; &gt;&gt; /home/thesheff17/installServer/=
file/file$a.txt <br>echo &quot;HELLO&quot; &gt;&gt; /home/thesheff17/instal=
lServer/file/file$a.txt=20
<br>done</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Below is the find command that tells me how many files are in the dire=
ctory.&nbsp; </div>
<div>&nbsp;</div>
production / # find /home/thesheff17/installServer<div>/file/ \! -type d | =
wc -l<br>10000001<br>production / #</div>

------=_Part_10149_1408206.1144694085828--
