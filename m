From: Bedros Hanounik <2bedros@gmail.com>
Subject: trusted processes
Date: Thu, 12 May 2005 17:19:00 -0700
Message-ID: <f18a8d98050512171937df19c4@mail.gmail.com>
Reply-To: Bedros Hanounik <2bedros@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_806_24116259.1115943540506"
Return-path: <reiserfs-list-return-24052-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_806_24116259.1115943540506
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

last year, I asked a question on this list whether we could have file=20
permissions for programs (or processes) in addition to users and groups. we=
=20
need this feature to reject malicious code from accessing system files.

Microsoft has a tech paper about having what they call trusted processes.=
=20
you can find it here=20

http://msdn.microsoft.com/mobility/default.aspx?pull=3D/library/en-us/dnppc=
gen/html/wmsecurity.asp

I don't know for how long they've been working on this, but I bet I came up=
=20
with this concept first.

what do you think guys of implementing such feature; should it be in the=20
file system, kernel, or both.=20

How hard is it to implement, besides the complexity of authentication=20
management.

-B

------=_Part_806_24116259.1115943540506
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

last year, I asked a question on this list whether we could have file
permissions for programs (or processes) in addition to users and
groups. we need this feature to reject malicious code from accessing
system files.<br>
<br>
Microsoft has a tech paper about having what they call trusted processes. y=
ou can find it here <br>
<br>
<a href=3D"http://msdn.microsoft.com/mobility/default.aspx?pull=3D/library/=
en-us/dnppcgen/html/wmsecurity.asp">http://msdn.microsoft.com/mobility/defa=
ult.aspx?pull=3D/library/en-us/dnppcgen/html/wmsecurity.asp</a><br>
<br>
I don't know for how long they've been working on this, but I bet I came up=
 with this concept first.<br>
<br>
what do you think guys of implementing such feature; should it be in the fi=
le system, kernel, or both. <br>
<br>
How hard is it to implement, besides the complexity of authentication manag=
ement.<br>
<br>
-B<br>
&nbsp;<br>

------=_Part_806_24116259.1115943540506--
