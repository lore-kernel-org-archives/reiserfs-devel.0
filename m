From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: 32bit UID/GID's Quota in 2.4!
Date: Fri, 11 Jul 2003 00:08:07 +0200
Message-ID: <20030711000807.58fa86a7.philippe.gramoulle@mmania.com>
References: <200307102119.11860.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14870-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200307102119.11860.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>


Hello Christian,

Jeez, i can't remember since when we needed and used this feature
(quotas with 32bit UID/GIDs) thanks to Jan Kara, Chris Mason,
Oleg Drokin and all ReiserFS team.

I'm pleased to see that it will finally make it into 2.4 series.

I haven't had time to look how "new" this quota code is and if it differs
from what is actually available through external patches though.

Thanks,

Philippe

--

Philippe Gramoull=E9
philippe.gramoulle@mmania.com
System & Network Engineer
NOC France - Lycos Europe




On Thu, 10 Jul 2003 21:19:11 +0200
Christian Mayrhuber <christian.mayrhuber@gmx.net> wrote:

  | Quote from Marcelo Tosatti:
  | "We decided to include this new code quota code which allows usage of q=
uotas with 32bit UID/GIDs."
  |=20
  | Finally this should mean there is a possibility to get reiserfs data lo=
gging + quota into the 2.4 kernel, doesn't it?
