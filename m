From: "Torrey Hoffman" <Torrey.Hoffman@myrio.com>
Subject: Reliable system updates built on ReiserFS
Date: Tue, 23 Apr 2002 17:41:18 -0700
Message-ID: <A015F722AB845E4B8458CBABDFFE63420FE3DB@mail0.myrio.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Michael Carmack <karmak@karmak.org>
Cc: Ross Vandegrift <ross@willow.seitz.com>, reiserfs-list@namesys.com

Hans Reiser wrote on the subject "RE: [reiserfs-list] Scrambled Files":
[...]=20

> If you want to be able to crash while doing an OS upgrade,=20
> and not have=20
> a hosed system, you must have transactions (or take a snapshot before=20
> doing it).  No FS currently supports transactions, but reiser4 will.

This is true.  However, if someone out there needs to implement reliable =

system updates right now, they might find this helpful...

You can get pretty good reliability by doing "transactions" at an=20
application level, not 100% perhaps, but good enough that for most=20
systems, hardware failure is more likely than a failure of the update=20
system...=20

If you are using a journaling filesystem with an atomic "rename"
operation, (which reiserfs does) and your update software has a hook=20
into the system boot process, then you can do reliable updates=20
despite system crashes / power failures using something like the=20
following (pseudocode):

subroutine switch_to_phase(string s)
{
	touch ("/var/flag.%s", s);
	sync filesystem
	delete any other /var/flag.whatever files
	sync filesystem
}

function do_reliable_update()
{
	switch_to_phase("preparation");

	/* during this phase, only touch files in some working=20
	** update directory=20
	*/

	collect_all_required_files();
	authenticate_and_checksum_required_files();

	/* and, build lists of all files to be updated,=20
	** source and destination directories, checksums, etc.=20
	*/
=09
	switch_to_phase("copying");
=09
	for each (file $f to be updated) {
		copy new version of $f to "destdir/$f.NEW"
	}
	for each (file $f to be updated) {
		verify checksum of "destdir/$f.NEW"
	}

	switch_to_phase("renaming");

	for each (file $f to be updated) {
		rename "destdir/$f.NEW" "destdir/$f"
	}

	switch_to_phase("completing");

	do_other_update_stuff();
	/* update symbolic links, delete old redundant files, etc. */

	sync filesystem
	delete all /var/flag files
	sync filesystem

	/* update is successful */
}

Very early in the system bootup process, do something like this:

function recover_from_update_crash() {

	if (exists any file /var/flag.$updatephase) then
		$updatephase =3D the last or highest existing /var/flag.$updatephase
	else
		return; /* no recovery necessary. */

	switch ($updatephase)
	{
		case "copying" :
			/* Delete all the *.NEW files from the filesystem,
			** and then...=20
			*/
		case "preparation":
			/* Delete all the files from the working update=20
			** directory.=20
			**
			** Now we have recovered to the pre-update state.=20
			** Could retry, or log an error, or whatever.
			*/
			break;
		=09
		case "renaming" :
			for each (file f to be updated) {
				if exists "destdir/f.NEW" then
					rename "destdir/f.NEW" "destdir/f"
				}
			}
			switch_to_phase("completing");
			/* no break */

		case "completing"
			do_other_update_stuff();

			sync filesystem
			delete all /var/flag files
			sync filesystem
	}
}

Real life is a little more complicated.  But unless you are updating
something used very early in the boot process, like glibc, ld.linux.so,
init, kernel / modules, this works very well.  For those low-level=20
things, you can augment the outline above with tricks with symbolic=20
links...  luckily, those sorts of things don't usually need to be=20
updated.

Oh yeah: this also has the disadvantage of possibly requiring a lot
of free space for all the .NEW files.  And, like any other real
programming problem, intelligent error recovery is the hardest part.

But it does work.=20

I built a system along these lines, and it can handle having the power
plug yanked out at any point during the update process.  It always=20
either completes the update or backs it out to the pre-update state.

It is used on hundreds of systems - soon thousands - and has never=20
failed. Yet :-)=20

Of course, this would not work at all if the filesystems were not
journaled.  I've never, ever, seen reiserfs blow up despite a lot=20
of pulling-the-plug-on-running-systems in the last two years.

Torrey Hoffman

