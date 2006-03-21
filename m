From: "Cleyton Ferreira" <cleyton@gmail.com>
Subject: filesystem causes high wait I/O
Date: Tue, 21 Mar 2006 11:58:35 -0300
Message-ID: <ad80cfc70603210658u6e6e68b1la959439da622c75a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_4496_32657251.1142953115239"
Return-path: <reiserfs-list-return-28303-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_4496_32657251.1142953115239
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I'm using reiserfs 3.6.18-3 and we got a different problem.
A little briefing about the server:
- SuSE Linux 9.3 (x86-64)
- kernel 2.6.11.4-21.7-smp
- Intel (2 processors)

After months without incident, this server running on hardware Intel show u=
s
a big load caused by wait for I/O on the reiserfs.

There was no different read or write access, no diferent network load
neither diferent process on system.

The reiserfsck output is Ok. No corruptions found.

There is only one solution we see: Backup, make a new fs, Restore.

Has anybody seen problem like that?

regards,

 Cleyton

------=_Part_4496_32657251.1142953115239
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hi,</div>
<div><br>I'm using reiserfs 3.6.18-3 and we got a different problem.</div>
<div>A little briefing about the server:</div>
<div>- SuSE Linux 9.3 (x86-64)<br>- kernel 2.6.11.4-21.7-smp </div>
<div>- Intel (2 processors)</div>
<div>&nbsp;</div>
<div>After months without incident, this server running on hardware Intel s=
how us a big&nbsp;load caused&nbsp;by&nbsp;wait for I/O&nbsp;on the reiserf=
s.</div>
<div>&nbsp;</div>
<div>There was no different read or write access, no diferent network load =
neither diferent process on system.</div>
<div>&nbsp;</div>
<div>The reiserfsck output is Ok. No corruptions found.</div>
<div>&nbsp;</div>
<div>There is only one solution we see: Backup, make a new fs, Restore.</di=
v>
<div>&nbsp;</div>
<div>Has anybody seen problem like that?</div>
<div>&nbsp;</div>
<div>regards,</div>
<div>&nbsp;</div>
<div>&nbsp;Cleyton</div>

------=_Part_4496_32657251.1142953115239--
