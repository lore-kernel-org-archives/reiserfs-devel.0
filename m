From: Jens Benecke <jens@spamfreemail.de>
Subject: Re: Errors requiring --rebuild-tree in 2.4.23
Date: Sat, 13 Dec 2003 18:38:29 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <brfiql$orq$1@sea.gmane.org>
References: <br9soe$h0h$1@sea.gmane.org> <1071152521.11147.88.camel@tiny.suse.com> <bra6s2$9ug$1@sea.gmane.org> <3FD8C398.6040903@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16342-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hans Reiser wrote:

> errors like this are not due to a lack of data-logging.
>=20
> Dec  1 06:26:05 artus kernel: is_leaf: item location seems wrong (second
> one): *3.6* [113366 113466 0x1 DIRECT], item_len 280, item_location 1216,
> free_space(entry_count) 65535

Hello Hans,

can you imagine a hardware failure causing these errors that does not show
up in the logs? Usually IDE disk failures are accompanied with IDE layer
errors, unless the disk is totally down (which it isn't in this case).



--=20
Jens Benecke (jens at spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic

