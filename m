From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs3, rsync and hardlinks
Date: Mon, 7 Feb 2005 16:32:58 -0500
Message-ID: <200502071632.59292.mason@suse.com>
References: <20050206034102.3956432d@polo.concept-micro.com> <1107771769.9024.119.camel@tribesman.namesys.com> <20050207215036.39ca391c@polo.concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050207215036.39ca391c@polo.concept-micro.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Pierre Etchemaite <petchema@concept-micro.com>

On Monday 07 February 2005 15:50, Pierre Etchemaite wrote:
> Le lun 07 f=E9v 2005 13:22:51 CET, Vladimir Saveliev <vs@namesys.com> a =
=E9crit
>
> > Hello
>
> 	Hi,
>
> > yes, reiserfs reuses inode number of removed files for newly created
> > files. However, ext2 also does that. Have  you ever noticed this problem
> > on other filesystems?
>
> No, but I'm only using rsync -H for a few weeks. The problem may also exi=
st
> with tar, but unnoticed (unless tar detects hardlinks in a different way,
> or does more checks, like checking the consistency with references
> counters, whatever, to avoid it). rsync handles hardlinks in a final pass,
> so as soon as the verbosity level is raised, problems are easy to detect.
>
> I have only one server left that uses ext2. It's also saved with rsync, no
> problem seen so far (a few weeks only, as I said).
> But the filesystem used isn't the only difference. Usage pattern probably
> matters a lot. On the system where it happens, hardlinked files are often
> Maildir files (unsurprizingly) and mrtg log files (which are rotated every
> 5 minutes). inodes are probably freed by mrtg, and one reused for a new
> email.
>
If you've got files being deleted in the middle of the backup,  then it is=
=20
extremely difficult for rsync (or any tool) to get the hard link detection=
=20
correct.  You've got a few choices:

1) put everything on lvm and backup snapshots instead of the live filesyste=
m. =20
This has a number of benefits.

2) link everyfile into some temp directory before the backup starts.  This=
=20
will prevent that particular inode number from being reused during the=20
backup, but won't help if new files are added during the rsync (since those=
=20
new files could also be deleted).

for each file in backup list
    ln file tmpdir/counter
    counter++
rsync
rm -rf  tmpdir

=2Dchris
