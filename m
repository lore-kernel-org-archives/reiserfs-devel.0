From: "Chester R. Hosey" <chosey@nauticom.net>
Subject: Re: need opinions from sysadmins on where reiser4progs should install
Date: Fri, 25 Nov 2005 11:54:55 -0500
Message-ID: <438741DF.8@nauticom.net>
References: <20051120040723.GA1392@148.Red-217-126-33.pooles.rima-tde.net.>	 <20051120115529.633B1177A@philou.gramoulle.local>	 <4381728D.7030300@namesys.com> <200511211632.17965.vitaly@namesys.com>	 <43820CC4.2010205@namesys.com> <b14e81f00511211604r60bfbfna3f04818430d8e05@mail.gmail.com> <43837298.6050500@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43837298.6050500@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

David Masover wrote:
> 
> I don't see anything that makes a packaged reiser4progs better than an
> unpackaged one, except for the two things you're defeating with any
> custom version:  dependencies and automatic updates.

One big benefit is that installed files are never "lost". It's often
difficult to clean up after a "make install" directly to the target
location. By setting --prefix to a temporary location, building and
installing, then making a tar.gz from the installed files and running
through alien to get a .deb, it's much (much!) easier to remove the
package if I decide to revert to an upstream version, or simply don't
care for the program. It's something like:

./configure --prefix=/tmp/foo && make && make install
cd /tmp/foo
tar czvf ../package.tar.gz *
cd ..
alien package.tar.gz
su (type password)
dpkg -i generated-package-name.deb

A "make install" will often overwrite existing files without asking
first, while a good package manager will warn about conflicts before
trashing old data. Using package management insulates users from having
to know about each file "make install" wants to install. It's let me try
third-party software on one of my Debian machines without worrying about
collateral damage or difficult clean-up afterwards.

That said, I do agree with "make install" defaulting to /usr/local with
a warning that it may not be what the sysadmin wanted. It will warn
those who might not be familiar with convention, while doing what will
be expected by those who are.

Chet
