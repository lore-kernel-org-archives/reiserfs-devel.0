From: Pierre =?UTF-8?B?RXRjaGVtYcOvdMOp?= <petchema@concept-micro.com>
Subject: Re: reiser4 plugins
Date: Sat, 2 Jul 2005 14:28:46 +0200
Message-ID: <20050702142846.78af7891.petchema@concept-micro.com>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl>
	<200506261816.j5QIGMdI010142@turing-police.cc.vt.edu>
	<42BF08CF.2020703@slaphack.com>
	<200506262105.j5QL5kdR018609@turing-police.cc.vt.edu>
	<42BF2DC4.8030901@slaphack.com>
	<200506270040.j5R0eUNA030632@turing-police.cc.vt.edu>
	<42BF667C.50606@slaphack.com>
	<5284F665-873C-45B7-8DDB-5F475F2CE399@mac.com>
	<42BF7167.80201@slaphack.com>
	<EC02A684-815A-4DF8-B5C1-9029FE45E187@mac.com>
	<42C06D59.2090200@slaphack.com>
	<CD59AE36-FD15-4A4C-9E1D-AB2F8B52D653@mac.com>
	<42C08B5E.2080000@slaphack.com>
	<87y88vrzkg.fsf@evinrude.uhoreg.ca>
	<EBD8F590-0113-4509-9604-E6967C65C835@mac.com>
	<87mzpbrvpf.fsf@evinrude.uhoreg.ca>
	<D3A4ABBF-8062-4399-B1EC-61722295944A@mac.com>
	<87irzzrqu7.fsf@evinrude.uhoreg.ca>
	<2B1C058D-C304-4E15-ACDA-C3337E67E981@mac.com>
	<87d5q6pdyv.fsf@evinrude.uhoreg.ca>
	<C7DB345A-CD35-4A4C-89F7-5BBD3CB83DF4@ma
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24918-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C50804.4050006@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Fri, 01 Jul 2005 04:08:20 -0500, David Masover <ninja@slaphack.com> a =
=C3=A9crit :

Hi all,

> Metafs also avoids having to patch tar.  It's assumed that legacy backup =

> systems can always avoid metafs and still catch almost everything=20
> important, and certainly everything they already do catch.  With a=20
> hybrid or an entirely new backup system, we could catch everything,=20
> including any new ACL-like animals that people invent.

As an administrator, a way to perfectly save and restore the content of
file systems is a requirement. Crashes do happen, so do migration to new
disk subsystems, system cloning, etc, etc.

If restoration can be done with the standard tools you find on any live
rescue CD, it's even better.

All what's probably needed is some readable-writable non-confusing
(fully POSIX compliant) "view" that's guaranteed to contain all existing
"raw" data and metadata).

BR,
Pierre.
