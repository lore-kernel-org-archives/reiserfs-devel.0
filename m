From: Fabiano Reis <silos.reis@ig.com.br>
Subject: mount hang on kernel 2.6
Date: Sun, 7 Mar 2004 19:32:03 -0300
Message-ID: <20040307_223203_003004.silos.reis@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1078698723"
Return-path: <reiserfs-list-return-17114-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Message-Boundary-by-Mail-Sender-1078698723
Content-Type: text/plain; charset="iso-8859-1"
Content-description: Mail message body
Content-Transfer-Encoding: quoted-printable
Content-disposition: inline

Hi list,=20

I=B4m having problems to mount a reiserfs filesystem using kernel 2.6.3 on =

RedHat 9.=20

The fs I=B4m trying to mount was formated using kernel 2.4.20-24.9 (the lat=
est=20
kernel for RH9) with ReiserFS version 3.6.25 (from dmesg) and reiserfsprogs=
=20
3.6.4 (from reiserfsck -v command)=20

I upgraded to kernel 2.6.3 (rpm from=20
http://people.redhat.com/arjanv/2.6/RPMS.kernel/)=20

The symptom: When I execute the command=20

mount /dev/sda8 /mnt , the command hangs. Using dmesg I can see this=20
message:=20

"Using r5 hash to sort names"=20

and nothing happens after this message. The command still hanged and there =

is nothing on messages (syslog).=20

It sounds to me like a problem. I cant mount the partition, so Do I have to=
=20
upgrade reiserfs driver on kernel 2.6?=20

I will appreciate any answers.=20

-=20
Fabiano=20

_________________________________________________________
Voce quer um iGMail protegido contra v=EDrus e spams?=20
Clique aqui: http://www.igmailseguro.ig.com.br


--Message-Boundary-by-Mail-Sender-1078698723--

