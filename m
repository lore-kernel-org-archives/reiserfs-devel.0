From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: need opinions from sysadmins on where reiser4progs should install
Date: Tue, 22 Nov 2005 15:14:45 -0500
Message-ID: <873blov3re.fsf@evinrude.uhoreg.ca>
References: <20051120040723.GA1392@148.Red-217-126-33.pooles.rima-tde.net.>
	<20051120115529.633B1177A@philou.gramoulle.local>
	<4381728D.7030300@namesys.com> <200511211632.17965.vitaly@namesys.com>
	<43820CC4.2010205@namesys.com>
	<b14e81f00511211604r60bfbfna3f04818430d8e05@mail.gmail.com>
	<43837298.6050500@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27085-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43837298.6050500@slaphack.com> (David Masover's message of "Tue,
	22 Nov 2005 13:33:44 -0600")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, 22 Nov 2005 13:33:44 -0600, David Masover <ninja@slaphack.com> said:

> michael chang wrote:

>> or to actually put package building scripts for package-handling
>> distros in the source package (or use something like checkinstall,
>> provided it doesn't conflict too bad).  [You can also did what Debian
>> did with it's 'kernel-package' system; it provides a package
>> specially designed for converting a custom kernel into a package,

> I think that's overkill, unless Debian really has no way to "provide"
> or "inject" a particular package.

Debian has a package called "equivs" that allows you to create dummy
packages.

But it is generally better to just include a debian/ directory in the
sources, and let the Debian package management just handle everything
for you (e.g. upgrading to a new version when Debian includes a newer
version).

Debian generally frowns upon including a debian/ directory in the
upstream sources without any good reason.  But I think that in this
case, there is a good reason.  Just make sure to work with the Debian
maintainer of reiser4progs (Ed Boraas) if you want to do that.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

