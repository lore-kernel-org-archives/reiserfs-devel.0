From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Status of quota support for reiserfs on 2.6.x kernels
Date: Tue, 23 Nov 2004 10:53:32 +0100
Message-ID: <20041123105332.02470503.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22525-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: ReiserFS Mailing List <reiserfs-list@namesys.com>


 Hello,

Currently we use some Linux NFS servers with 2.4.25 kernel patched to suppo=
rt quotas.

Since we face some I/O issues, i'd like to try out a 2.6.x kernel but quota=
 support is mandatory.

So my question: is quota support for 2.6.x ( 2.6.9 and above preferably) av=
ailable and considered stable enough
to be used in heavy production environment ( high I/O pretty much 24/24 ) ?

If yes, which kernel do i need, and where can i find the quota patches ?

I've found some old quota patch (for 2.6.5 from march 2004) on Chris Mason =
suse FTP experimental directory and i also
saw that Jan Kara has posted several quota patches recently.

Thanks for a quick update on this topic.

Truly yours,

Philippe

--

Philippe Gramoull=E9 <philippe.gramoulle@mmania.com>
System & Network Administrator
Lycos Europe
