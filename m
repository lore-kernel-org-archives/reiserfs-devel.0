From: David Masover <ninja@slaphack.com>
Subject: Re: need opinions from sysadmins on where reiser4progs should install
Date: Tue, 22 Nov 2005 13:33:44 -0600
Message-ID: <43837298.6050500@slaphack.com>
References: <20051120040723.GA1392@148.Red-217-126-33.pooles.rima-tde.net.>	 <20051120115529.633B1177A@philou.gramoulle.local>	 <4381728D.7030300@namesys.com> <200511211632.17965.vitaly@namesys.com>	 <43820CC4.2010205@namesys.com> <b14e81f00511211604r60bfbfna3f04818430d8e05@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27083-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00511211604r60bfbfna3f04818430d8e05@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: michael chang <thenewme91@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, Vitaly Fertman <vitaly@namesys.com>, =?UTF-8?B?UGhpbGlwcGUgR3JhbW91bGzDqQ==?= <philippe@gramoulle.com>, reiserfs-list@namesys.com

michael chang wrote:
> On 11/21/05, Hans Reiser <reiser@namesys.com> wrote:
>=20
>>Vitaly Fertman wrote:
>>
>>
>>>On Monday 21 November 2005 10:09, Hans Reiser wrote:
>>>
>>>
>>>
>>>>Philippe Gramoull=D0=98 wrote:
>>>>
>>>>
>>>>
>>>>
>>>>>Hello,
>>>>>
>>>>>On Sun, 20 Nov 2005 05:07:23 +0100
>>>>>rvalles <rvalles@es.gnu.org> wrote:
>>>>>
>>>>>| When I run make install on something and haven't specified a prefix =
on
>>>>>| configure, I expect /usr/local to be used. If I wanted /, I'd have
>>>>>| specified that on configure time. If it installed in / by default, it
>>>>>| would, often, hit the "sacred package-system managed area" of the VFS
>>>>>| tree annoying people like me to a very great extend, so please don't.
>>>>>
>>>>>While i totally agree with you for standard packages, well i based my =
choice
>>>>>on actual experience of the last past six years of use with reiserfs V=
3.
>>>>>
>>>>>I can't remember how many times i heard Namesys team say " Install the=
 latest
>>>>>& greatest reiserfsck", how many times distro thought they knew reiser=
fsprogs
>>>>>internals better than Namesys and customized it to the point where it =
would
>>>>>eventually break.
>>>>>
>>>>>Of course, i can live with a manual install of reiser(fs|4)progs, so i=
 don't
>>>>>really mind, but talking of support, it can make quite a difference to=
 Namesys
>>>>>in terms of support, and annoyance with bug reports that could have be=
en easily
>>>>>avoided.
>>>>>
>>>>>
>>>>>
>>>>>
>>>>
>>>>Ok, I propose the following: search the standard locations for where it
>>>>is currently, tell the user, ask the user if they want to rename those
>>>>
>>>>
>>>
>>>the proper service is already done in package managers. if one needs it,
>>>he can use one of them.
>>>
>>>
>>>
>>>
>>>>versions to *.old if the install of the new one succeeds, and then
>>>>
>>>>
>>>
>>>this breaks the installed software consistency and may screw the package
>>>manager up...
>>>
>>>
>>
>>Sigh, good point, ok, well then at least warn the user about them.
>>
>>
>>>
>>>>prompt for the install location with /sbin as the suggested default.  I
>>>>think that unlike other user installed programs, fsck does not belong in
>>>>/usr/local.  I think Philippe's point that old versions are dangerous is
>>>>quite valid.
>>>>
>>>>
>>>
>>>install to the system default through a system package manager;
>>>
>>>install to the local default from source to not break the system install=
ed
>>>software consistency;
>>>
>>>
>>
>>So the reason for not installing to /sbin is to avoid messing up the
>>package manager?  I regret to say it makes sense.  If that is the
>>reason, then warn the user please about old versions left intact, and
>>suggest they be removed, and prompt the user for the path to install to
>>and remind them to update their $PATH.
>>
>=20
>=20
> The problem is that some package managers might make reiser4progs a
> "base" package, which removing will emit a loud warning that it might
> break your system.  That said, anyone installing a custom reiser4progs
> may or may not be supposed to have the knowledge to work around it.

Replace "reiser4progs" with "e2fsprogs" and see if it still makes sense.

On my Gentoo system, e2fsprogs is depended on by util-linux, but
reiser4progs isn't depended on by anything, despite the fact that my
root fs is reiser4.  I actually need both -- my /boot is ext3 and my
initrd is ext2.

I see little reason for any of this to change, except maybe to be more
consistent -- either require all FS tools, or force the user to install
the package they need.  Which wouldn't be so bad -- after all, Gentoo
already makes me install the system logger manually, because there are
three possible sysloggers available, so I get a choice at install time.

> It might be easier to make a pseudo-package representing the program

Portage has had this for awhile.  I just add the package name to
/etc/portage/profile/package.provided
and Portage will never install that package as a dependency.

This used to be called "injecting", which actually inserted an empty
package, but now exists in that config file.

> or to actually put
> package building scripts for package-handling distros in the source
> package (or use something like checkinstall, provided it doesn't
> conflict too bad).  [You can also did what Debian did with it's
> 'kernel-package' system; it provides a package specially designed for
> converting a custom kernel into a package,

I think that's overkill, unless Debian really has no way to "provide" or
"inject" a particular package.  Someone who knows how to use
kernel-package can probably also handle package.provide.

The main thing that's nice about kernel-package isn't the
dependency-handling, it's the way it simplifies the process of
installing and managing multiple custom kernels.  For one thing, Debian
manages bootloader config files, generating menu entries and such, and
installing an actual kernel package (custom or otherwise) automatically
copies the kernel image to /boot and updates grub.conf (or whatever)
with an entry named for that kernel version.

I don't see anything that makes a packaged reiser4progs better than an
unpackaged one, except for the two things you're defeating with any
custom version:  dependencies and automatic updates.
