From: "Sergey S. Kostyliov" <rathamahata@ehouse.ru>
Subject: Re: ftp.namesys.com: connection refused
Date: Sun, 9 Jan 2005 23:53:52 +0300
Message-ID: <200501092353.52259.rathamahata@ehouse.ru>
References: <8jfd5wgbgmk.fsf@panter.stud.ntnu.no>
Reply-To: "Sergey S. Kostyliov" <rathamahata@ehouse.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23101-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <8jfd5wgbgmk.fsf@panter.stud.ntnu.no>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Lars Tobias =?iso-8859-1?q?B=F8rsting?= <larstobi@stud.ntnu.no>

Hello,

On Saturday 08 January 2005 09:05, Lars Tobias B=F8rsting wrote:
> Hi,
>=20
> I have been trying to download the patch for the 2.6.10 kernel from
> ftp.namesys.com but I get connection refused from the server:
>=20
>      %  ncftp ftp.namesys.com
>      NcFTP 3.0.3 (April 15, 2001) by Mike Gleason (ncftp@ncftp.com).
>      Could not connect to 212.16.7.65: Connection refused.
>      Sleeping 17 seconds...
>=20
> Is there anyone of you who can connect to the ftp server? And does
> anyone know a secondary place to download the latest patches?
For some reasons (firewall?) ftp server at namesys works only in passive
mode.

Could you please try if `set passive yes' helps for you?

--=20
Sergey S. Kostyliov <rathamahata@ehouse.ru>
Jabber ID: rathamahata@jabber.org
