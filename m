From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: File as a directory - file-as-dir vs. link-dirs (again) - 3/3
Date: Fri, 18 Nov 2005 22:13:32 -0500
Message-ID: <878xvlqqhv.fsf@evinrude.uhoreg.ca>
References: <ff8010840511171942x2ae2ebd0m954209103da18740@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27022-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ff8010840511171942x2ae2ebd0m954209103da18740@mail.gmail.com>
	(Leo Comerford's message of "Fri, 18 Nov 2005 03:42:50 +0000")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

P.S. your relational model can easily be expressed using file-as-dir
(well, actually, just standard directories):

/(something)/father-son/aardvark/father is a symlink to
  '/(whatever)/portrait/Mike')
/(something)/father-son/aardvark/son is a symlink to
  '/(whatever)/portrait/Bob')

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

